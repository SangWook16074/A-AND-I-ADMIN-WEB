import 'dart:convert';

import 'package:aandi_api_protocol/aandi_api_protocol.dart';
import 'package:http/http.dart' as http;

import '../dtos/auth_dtos.dart';

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

final class AuthApiClient {
  AuthApiClient({required this.baseUrl, http.Client? client})
    : _client = wrapWithAandiProtocolClient(client ?? http.Client());

  final String baseUrl;
  final http.Client _client;

  Future<LoginResponseDto> login(LoginRequestDto request) async {
    final payload = await _post('/v2/auth/login', body: request.toJson());
    return LoginResponseDto.fromJson(payload);
  }

  Future<RefreshResponseDto> refresh(RefreshRequestDto request) async {
    final payload = await _post('/v2/auth/refresh', body: request.toJson());
    return RefreshResponseDto.fromJson(payload);
  }

  Future<void> logout(LogoutRequestDto request) async {
    await _post('/v2/auth/logout', body: request.toJson());
  }

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
