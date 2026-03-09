import 'package:aandi_auth/aandi_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_summary.freezed.dart';
part 'admin_user_summary.g.dart';

/// 관리자 사용자 목록 조회 시 각 유저를 표현하는 읽기 전용 모델입니다.
@freezed
abstract class AdminUserSummary with _$AdminUserSummary {
  const factory AdminUserSummary({
    required String id,
    required String username,
    required AuthRole role,
    String? nickname,
    String? publicCode,
    String? userTrack,
    int? cohort,
    int? cohortOrder,
    bool? forcePasswordChange,
    String? inviteLink,
    String? inviteExpiresAt,
    bool? active,
  }) = _AdminUserSummary;

  factory AdminUserSummary.fromJson(Map<String, dynamic> json) =>
      _$AdminUserSummaryFromJson(json);
}
