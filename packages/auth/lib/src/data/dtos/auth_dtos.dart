import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dtos.freezed.dart';
part 'auth_dtos.g.dart';

/// 서버와 주고받는 권한 enum DTO.
enum AuthRoleDto {
  @JsonValue('USER')
  user,
  @JsonValue('ORGANIZER')
  organizer,
  @JsonValue('ADMIN')
  admin,
}

/// API 오류 페이로드 DTO.
@freezed
abstract class ApiErrorDto with _$ApiErrorDto {
  const factory ApiErrorDto({String? code, String? message}) = _ApiErrorDto;

  /// JSON 역직렬화.
  factory ApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDtoFromJson(json);
}

/// 로그인 요청 DTO.
@freezed
abstract class LoginRequestDto with _$LoginRequestDto {
  const factory LoginRequestDto({
    required String username,
    required String password,
  }) = _LoginRequestDto;

  /// JSON 역직렬화.
  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);
}

/// 토큰 갱신 요청 DTO.
@freezed
abstract class RefreshRequestDto with _$RefreshRequestDto {
  const factory RefreshRequestDto({required String refreshToken}) =
      _RefreshRequestDto;

  /// JSON 역직렬화.
  factory RefreshRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestDtoFromJson(json);
}

/// 로그아웃 요청 DTO.
@freezed
abstract class LogoutRequestDto with _$LogoutRequestDto {
  const factory LogoutRequestDto({required String refreshToken}) =
      _LogoutRequestDto;

  /// JSON 역직렬화.
  factory LogoutRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestDtoFromJson(json);
}

/// 로그인 응답에 포함되는 사용자 정보 DTO.
@freezed
abstract class LoginUserDto with _$LoginUserDto {
  const factory LoginUserDto({
    required String id,
    required String username,
    required AuthRoleDto role,
  }) = _LoginUserDto;

  /// JSON 역직렬화.
  factory LoginUserDto.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDtoFromJson(json);
}

/// 로그인 응답 DTO.
@freezed
abstract class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
    String? tokenType,
    required LoginUserDto user,
  }) = _LoginResponseDto;

  /// JSON 역직렬화.
  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}

/// 토큰 재발급 응답 DTO.
@freezed
abstract class RefreshResponseDto with _$RefreshResponseDto {
  const factory RefreshResponseDto({
    required String accessToken,
    required int expiresIn,
  }) = _RefreshResponseDto;

  /// JSON 역직렬화.
  factory RefreshResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseDtoFromJson(json);
}

/// 로그아웃 응답 DTO.
@freezed
abstract class LogoutResponseDto with _$LogoutResponseDto {
  const factory LogoutResponseDto({required bool success}) = _LogoutResponseDto;

  /// JSON 역직렬화.
  factory LogoutResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseDtoFromJson(json);
}

/// 현재 로그인한 사용자 정보 응답 DTO.
@freezed
abstract class MeResponseDto with _$MeResponseDto {
  const factory MeResponseDto({
    required String id,
    required String username,
    required AuthRoleDto role,
  }) = _MeResponseDto;

  /// JSON 역직렬화.
  factory MeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MeResponseDtoFromJson(json);
}

/// 백엔드 공통 응답 envelope DTO.
///
/// `data`의 실제 타입은 엔드포인트마다 달라서 [Object]로 받은 뒤,
/// 호출부에서 필요한 shape으로 캐스팅해 사용한다.
@freezed
abstract class ApiEnvelopeDto with _$ApiEnvelopeDto {
  const factory ApiEnvelopeDto({
    required bool success,
    Object? data,
    ApiErrorDto? error,
    DateTime? timestamp,
  }) = _ApiEnvelopeDto;

  /// JSON 역직렬화.
  factory ApiEnvelopeDto.fromJson(Map<String, dynamic> json) =>
      _$ApiEnvelopeDtoFromJson(json);
}
