import 'package:aandi_auth/aandi_auth.dart';

import 'json_value_readers.dart';

/// 관리자 사용자 목록 조회 시 각 유저를 표현하는 읽기 전용 모델입니다.
class AdminUserSummary {
  const AdminUserSummary({
    required this.id,
    required this.username,
    required this.role,
    this.nickname,
    this.publicCode,
    this.userTrack,
    this.cohort,
    this.cohortOrder,
    this.forcePasswordChange,
    this.inviteLink,
    this.inviteExpiresAt,
    this.active,
  });

  factory AdminUserSummary.fromJson(Map<String, dynamic> json) {
    return AdminUserSummary(
      id: (json['id'] ?? '').toString(),
      username: (json['username'] ?? '').toString(),
      role: AuthRole.fromApi((json['role'] ?? 'USER').toString()),
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
      forcePasswordChange: json['forcePasswordChange'] as bool?,
      inviteLink: json['inviteLink'] as String?,
      inviteExpiresAt: json['inviteExpiresAt'] as String?,
      active: json['active'] as bool?,
    );
  }

  final String id;
  final String username;
  final AuthRole role;
  final String? nickname;

  /// 외부 노출용 식별 코드입니다.
  final String? publicCode;

  /// 유저가 속한 트랙(예: FE, BE, AI)입니다.
  final String? userTrack;

  /// 유저가 속한 기수(cohort) 번호입니다.
  final int? cohort;

  /// 동일 기수(cohort) 안에서의 정렬 순번입니다.
  final int? cohortOrder;

  /// 다음 로그인 시 비밀번호 변경 강제 여부입니다.
  final bool? forcePasswordChange;

  /// 초대 방식 계정의 초대 링크입니다.
  final String? inviteLink;

  /// 초대 만료 시각(문자열 원본)입니다.
  final String? inviteExpiresAt;
  final bool? active;
}
