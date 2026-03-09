import 'package:aandi_auth/aandi_auth.dart';

import 'admin_user_provision_type.dart';
import 'json_value_readers.dart';

/// 관리자 계정 생성 API의 성공 응답 모델입니다.
class CreateAdminUserResponse {
  const CreateAdminUserResponse({
    required this.id,
    required this.username,
    required this.role,
    required this.provisionType,
    this.nickname,
    this.publicCode,
    this.userTrack,
    this.cohort,
    this.cohortOrder,
    this.inviteLink,
    this.expiresAt,
    this.temporaryPassword,
  });

  factory CreateAdminUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateAdminUserResponse(
      id: (json['id'] ?? '').toString(),
      username: (json['username'] ?? '').toString(),
      role: AuthRole.fromApi((json['role'] ?? 'USER').toString()),
      provisionType: switch ((json['provisionType'] ?? '').toString()) {
        'PASSWORD' => AdminUserProvisionType.password,
        _ => AdminUserProvisionType.invite,
      },
      nickname: readFirstNonEmptyString(json, const ['nickname', 'nickName']),
      publicCode: readFirstNonEmptyString(json, const [
        'publicCode',
        'public_code',
      ]),
      userTrack: readFirstNonEmptyString(json, const [
        'userTrack',
        'user_track',
      ]),
      cohort: readIntOrNull(json['cohort']),
      cohortOrder: readIntOrNull(json['cohortOrder']),
      inviteLink: json['inviteLink'] as String?,
      expiresAt: json['expiresAt'] as String?,
      temporaryPassword: json['temporaryPassword'] as String?,
    );
  }

  final String id;
  final String username;
  final AuthRole role;

  /// 계정 전달 방식(초대/임시 비밀번호)입니다.
  final AdminUserProvisionType provisionType;
  final String? nickname;

  /// 외부 노출용 식별 코드입니다.
  final String? publicCode;

  /// 유저가 속한 트랙(예: FE, BE, AI)입니다.
  final String? userTrack;

  /// 유저가 속한 기수(cohort) 번호입니다.
  final int? cohort;

  /// 동일 기수(cohort) 안에서의 정렬 순번입니다.
  final int? cohortOrder;

  /// 초대 방식 계정에서 발급되는 링크입니다.
  final String? inviteLink;

  /// 초대/임시정보 만료 시각(문자열 원본)입니다.
  final String? expiresAt;

  /// 비밀번호 방식에서 발급되는 임시 비밀번호입니다.
  final String? temporaryPassword;
}
