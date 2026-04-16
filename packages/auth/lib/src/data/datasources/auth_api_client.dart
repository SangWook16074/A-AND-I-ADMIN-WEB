import 'dart:convert';

import 'package:aandi_api_protocol/aandi_api_protocol.dart';
import 'package:http/http.dart' as http;

import '../dtos/auth_dtos.dart';

/// 인증 API 통신 중 발생하는 예외.
///
/// HTTP 상태 코드와 서버 오류 코드를 함께 보관해서
/// 상위 계층에서 에러 분기를 쉽게 처리할 수 있다.
final class AuthApiException implements Exception {
  AuthApiException(this.message, {this.statusCode, this.code, this.alert});

  final String message;
  final int? statusCode;
  final String? code;
  final String? alert;

  @override
  String toString() =>
      'AuthApiException(statusCode: $statusCode, code: $code, message: $message)';
}

/// 인증 관련 백엔드 엔드포인트 호출 전담 클라이언트.
///
/// 모든 응답은 공통 envelope 형태로 파싱하고, 실패 조건은
/// [AuthApiException]으로 통일해 상위 계층으로 전달한다.
final class AuthApiClient {
  AuthApiClient({required this.baseUrl, http.Client? client})
    : _client = wrapWithAandiProtocolClient(client ?? http.Client());

  final String baseUrl;
  final http.Client _client;

  /// `/v2/auth/login` 호출.
  Future<LoginResponseDto> login(LoginRequestDto request) async {
    final payload = await _post('/v2/auth/login', body: request.toJson());
    return LoginResponseDto.fromJson(payload);
  }

  /// `/v2/auth/refresh` 호출.
  Future<RefreshResponseDto> refresh(RefreshRequestDto request) async {
    final payload = await _post('/v2/auth/refresh', body: request.toJson());
    return RefreshResponseDto.fromJson(payload);
  }

  /// `/v2/auth/logout` 호출.
  Future<void> logout(LogoutRequestDto request) async {
    await _post('/v2/auth/logout', body: request.toJson());
  }

  /// `/v2/me` 호출.
  Future<MeResponseDto> me({required String accessToken}) async {
    final payload = await _get('/v2/me', accessToken: accessToken);
    return MeResponseDto.fromJson(payload);
  }

  Future<Map<String, dynamic>> _post(
    String path, {
    required Map<String, dynamic> body,
    String? accessToken,
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await _client.post(
      uri,
      headers: _headers(accessToken),
      body: jsonEncode(body),
    );
    return _decodeEnvelope(response);
  }

  Future<Map<String, dynamic>> _get(String path, {String? accessToken}) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await _client.get(uri, headers: _headers(accessToken));
    return _decodeEnvelope(response);
  }

  Map<String, String> _headers(String? accessToken) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (accessToken != null && accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  /// 서버 응답을 공통 envelope 규칙에 맞게 검증/파싱한다.
  ///
  /// 성공 여부는 HTTP 코드와 `success` 필드를 모두 확인한다.
  Map<String, dynamic> _decodeEnvelope(http.Response response) {
    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw AuthApiException(
        'Invalid response shape',
        statusCode: response.statusCode,
      );
    }

    final envelope = ApiEnvelopeDto.fromJson(decoded);
    if (response.statusCode < 200 ||
        response.statusCode >= 300 ||
        !envelope.success) {
      final error = decoded['error'];
      throw AuthApiException(
        envelope.error?.message ?? 'Request failed',
        statusCode: response.statusCode,
        code: envelope.error?.code,
        alert: error is Map<String, dynamic>
            ? error['alert']?.toString()
            : null,
      );
    }

    final data = envelope.data;
    if (data is! Map<String, dynamic>) {
      throw AuthApiException(
        'Response data is missing',
        statusCode: response.statusCode,
      );
    }
    return data;
  }
}
