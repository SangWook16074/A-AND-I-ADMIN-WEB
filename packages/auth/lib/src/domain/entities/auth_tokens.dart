import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';
part 'auth_tokens.g.dart';

/// 인증 토큰 모델.
@freezed
abstract class AuthTokens with _$AuthTokens {
  /// [accessToken] API 인증에 사용하는 단기 토큰.
  /// [refreshToken] access token 재발급에 사용하는 장기 토큰.
  /// [expiresIn] access token 만료까지의 초 단위 TTL.
  /// [tokenType] 서버가 내려주는 토큰 타입(예: Bearer).
  const factory AuthTokens({
    required String accessToken,
    String? refreshToken,
    required int expiresIn,
    String? tokenType,
  }) = _AuthTokens;

  /// JSON 역직렬화.
  factory AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);
}
