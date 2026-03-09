import 'dart:convert';

import 'package:aandi_api_protocol/aandi_api_protocol.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'admin_api_exception.dart';
import 'admin_user_provision_type.dart';
import 'admin_user_summary.dart';
import 'create_admin_user_response.dart';

/// 관리자 유저 관리 API(`/v2/admin/users`)를 호출하는 클라이언트입니다.
///
/// 모든 요청은 `success/data/error` 형태의 공통 응답 계약을 기대하며,
/// 계약을 벗어난 경우 [AdminApiException]을 던집니다.
class AdminApiClient {
  AdminApiClient({required this.baseUrl, Dio? dio, http.Client? httpClient})
    : dio = dio ?? Dio(),
      _httpClient = wrapWithAandiProtocolClient(httpClient ?? http.Client()) {
    ensureAandiProtocolInterceptor(this.dio);
  }

  /// 유저 조회/생성/수정/삭제를 단일 엔드포인트로 처리하는 서버 규약 경로입니다.
  static const _usersPath = '/v2/admin/users';

  /// API 호스트(base url)입니다. 예: `https://api.example.com`
  final String baseUrl;

  /// HTTP 클라이언트입니다. 테스트에서는 외부에서 주입해 모킹할 수 있습니다.
  final Dio dio;
  final http.Client _httpClient;

  /// 관리자 유저 목록을 조회합니다.
  Future<List<AdminUserSummary>> getUsers({required String accessToken}) async {
    final response = await _requestJson(
      method: 'GET',
      accessToken: accessToken,
    );

    return _readListData(
      response.body,
      statusCode: response.statusCode,
    ).whereType<Map<String, dynamic>>().map(AdminUserSummary.fromJson).toList();
  }

  /// 단일 관리자 유저를 조회합니다.
  Future<AdminUserSummary> getUser({
    required String accessToken,
    required String userId,
  }) async {
    final response = await _requestJson(
      method: 'GET',
      accessToken: accessToken,
      pathSuffix: '/$userId',
    );

    return AdminUserSummary.fromJson(
      _readMapData(response.body, statusCode: response.statusCode),
    );
  }

  /// 공개 코드로 관리자 유저를 조회합니다.
  Future<AdminUserSummary> lookupUser({
    required String accessToken,
    required String code,
  }) async {
    final response = await _requestJson(
      method: 'GET',
      accessToken: accessToken,
      path: '/v2/users/lookup',
      queryParameters: {'code': code},
    );

    return AdminUserSummary.fromJson(
      _readMapData(response.body, statusCode: response.statusCode),
    );
  }

  /// 관리자 유저를 생성하고, 생성된 계정 메타데이터를 반환합니다.
  Future<CreateAdminUserResponse> createUser({
    required String accessToken,
    required AuthRole role,
    required AdminUserProvisionType provisionType,
    required int cohort,
  }) async {
    final response = await _requestJson(
      method: 'POST',
      accessToken: accessToken,
      path: '/v2/admin/users',
      data: {
        'role': role.toApi(),
        'provisionType': provisionType.toApi(),
        'cohort': cohort,
      },
    );

    return CreateAdminUserResponse.fromJson(
      _readMapData(response.body, statusCode: response.statusCode),
    );
  }

  /// 관리자 유저를 삭제합니다.
  Future<void> deleteUser({
    required String accessToken,
    required String userId,
  }) async {
    await _requestJson(
      method: 'DELETE',
      accessToken: accessToken,
      path: '$_usersPath/$userId',
    );
  }

  /// 관리자 유저의 비밀번호를 재설정하고 임시 비밀번호를 반환합니다.
  Future<String> resetPassword({
    required String accessToken,
    required String userId,
  }) async {
    final uri = Uri.parse('$baseUrl$_usersPath/$userId/password/reset');
    final httpResponse = await _httpClient.post(
      uri,
      headers: _headers(
        accessToken: accessToken,
        includeContentType: true,
      ).cast<String, String>(),
      body: jsonEncode({}),
    );
    final decoded = _decodeResponseMap(
      httpResponse.body,
      statusCode: httpResponse.statusCode,
      allowEmptySuccessBody: false,
    );
    if (decoded == null) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: httpResponse.statusCode,
      );
    }
    _throwIfRequestFailed(
      statusCode: httpResponse.statusCode,
      decoded: decoded,
    );
    final data = _readMapData(decoded, statusCode: httpResponse.statusCode);
    if (data['temporaryPassword'] is! String) {
      throw AdminApiException(
        'Missing temporaryPassword in response',
        statusCode: httpResponse.statusCode,
      );
    }
    return data['temporaryPassword'] as String;
  }

  /// 관리자 유저의 권한/프로필 정보를 수정합니다.
  Future<void> updateUser({
    required String accessToken,
    required String userId,
    required AuthRole role,
    required String userTrack,
    required int cohort,
    required String nickname,
  }) async {
    await _requestJson(
      method: 'PATCH',
      accessToken: accessToken,
      path: '$_usersPath/$userId',
      data: {
        'role': role.toApi(),
        'userTrack': userTrack,
        'cohort': cohort,
        'nickname': nickname,
      },
    );
  }

  /// 초대 메일을 일괄 발송합니다.
  Future<void> inviteMail({
    required String accessToken,
    required List<String> emails,
    required AuthRole role,
    required int cohort,
    required int cohortOrder,
    required String userTrack,
  }) async {
    await _requestJson(
      method: 'POST',
      accessToken: accessToken,
      path: '/v2/admin/invite-mail',
      data: {
        'emails': emails,
        'role': role.toApi(),
        'cohort': cohort,
        'cohortOrder': cohortOrder,
        'userTrack': userTrack,
      },
    );
  }

  /// 공통 JSON 요청 실행 메서드입니다.
  ///
  /// 1) 요청 전송
  /// 2) 응답 본문 디코딩
  /// 3) 실패 시 예외 변환
  /// 순서로 동작합니다.
  Future<({int statusCode, Map<String, dynamic> body})> _requestJson({
    required String method,
    required String accessToken,
    Object? data,
    bool allowEmptySuccessBody = false,
    String? path,
    String pathSuffix = '',
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = Uri.parse(
      '$baseUrl${path ?? _usersPath}$pathSuffix',
    ).replace(queryParameters: queryParameters);
    final response = await dio.requestUri<dynamic>(
      uri,
      data: data,
      options: Options(
        method: method,
        headers: _headers(
          accessToken: accessToken,
          includeContentType: data != null,
        ),
        contentType: data != null ? Headers.jsonContentType : null,
        responseType: ResponseType.plain,
        validateStatus: (_) => true,
      ),
    );

    final statusCode = response.statusCode ?? 0;
    final decoded = _decodeResponseMap(
      response.data,
      statusCode: statusCode,
      allowEmptySuccessBody: allowEmptySuccessBody,
    );
    if (decoded == null) {
      return (statusCode: statusCode, body: const <String, dynamic>{});
    }

    _throwIfRequestFailed(statusCode: statusCode, decoded: decoded);
    return (statusCode: statusCode, body: decoded);
  }

  /// 인증/콘텐츠 협상을 위한 기본 헤더를 구성합니다.
  Map<String, dynamic> _headers({
    required String accessToken,
    required bool includeContentType,
  }) {
    return {
      'Authorization': 'Bearer $accessToken',
      'Accept': 'application/json',
      if (includeContentType) 'Content-Type': 'application/json',
    };
  }

  /// 공통 응답의 `data`가 리스트인지 검증하고 반환합니다.
  List _readListData(Map<String, dynamic> decoded, {required int statusCode}) {
    final data = decoded['data'];
    if (data is! List) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: statusCode,
      );
    }
    return data;
  }

  /// 공통 응답의 `data`가 맵인지 검증하고 반환합니다.
  Map<String, dynamic> _readMapData(
    Map<String, dynamic> decoded, {
    required int statusCode,
  }) {
    final data = decoded['data'];
    if (data is! Map<String, dynamic>) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: statusCode,
      );
    }
    return data;
  }

  /// Dio 응답 바디를 `Map<String, dynamic>`으로 정규화합니다.
  ///
  /// - 성공 + 빈 바디 허용 케이스는 `null` 반환
  /// - 그 외 빈 바디/형식 불일치는 예외 처리
  Map<String, dynamic>? _decodeResponseMap(
    dynamic responseData, {
    required int statusCode,
    required bool allowEmptySuccessBody,
  }) {
    if (_isEmptyBody(responseData)) {
      if (allowEmptySuccessBody && _isSuccessfulStatus(statusCode)) {
        return null;
      }
      throw AdminApiException('요청에 실패했습니다.', statusCode: statusCode);
    }

    final decoded = switch (responseData) {
      Map<String, dynamic> value => value,
      Map value => value.map((key, value) => MapEntry(key.toString(), value)),
      String value => _decodeJsonString(value, statusCode: statusCode),
      _ => throw AdminApiException(
        'Invalid response shape',
        statusCode: statusCode,
      ),
    };

    return decoded;
  }

  /// 문자열(JSON text) 응답을 맵으로 파싱합니다.
  Map<String, dynamic> _decodeJsonString(
    String value, {
    required int statusCode,
  }) {
    try {
      final decoded = jsonDecode(value);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      if (decoded is Map) {
        return decoded.map((key, value) => MapEntry(key.toString(), value));
      }
      throw AdminApiException('Invalid response shape', statusCode: statusCode);
    } on FormatException {
      throw AdminApiException('Invalid response shape', statusCode: statusCode);
    }
  }

  /// `null` 또는 공백 문자열 응답을 빈 바디로 간주합니다.
  bool _isEmptyBody(dynamic responseData) {
    return responseData == null ||
        (responseData is String && responseData.trim().isEmpty);
  }

  /// HTTP 상태코드가 2xx 범위인지 확인합니다.
  bool _isSuccessfulStatus(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  /// 상태코드/응답 body를 기반으로 요청 실패 여부를 판단하고 예외를 던집니다.
  void _throwIfRequestFailed({
    required int statusCode,
    required Map<String, dynamic> decoded,
  }) {
    final success = decoded['success'] == true;
    final error = decoded['error'];
    if (_isSuccessfulStatus(statusCode) && success) {
      return;
    }

    final message = error is Map<String, dynamic>
        ? (error['message']?.toString() ?? '요청에 실패했습니다.')
        : '요청에 실패했습니다.';
    final code = error is Map<String, dynamic>
        ? error['code']?.toString()
        : null;
    final alert = error is Map<String, dynamic>
        ? error['alert']?.toString()
        : null;
    throw AdminApiException(
      message,
      statusCode: statusCode,
      code: code,
      alert: alert,
    );
  }
}
