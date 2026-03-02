import 'package:aandi_auth/aandi_auth.dart';

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
      nickname: _readString(json, const ['nickname', 'nickName']),
      publicCode: _readString(json, const ['publicCode', 'public_code']),
      userTrack: _readString(json, const ['userTrack', 'user_track']),
      cohort: _readInt(json['cohort']),
      cohortOrder: _readInt(json['cohortOrder']),
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
  final String? publicCode;
  final String? userTrack;
  final int? cohort;
  final int? cohortOrder;
  final bool? forcePasswordChange;
  final String? inviteLink;
  final String? inviteExpiresAt;
  final bool? active;
}

String? _readString(Map<String, dynamic> json, List<String> keys) {
  for (final key in keys) {
    final value = json[key];
    if (value != null) {
      final text = value.toString();
      if (text.trim().isNotEmpty) {
        return text;
      }
    }
  }
  return null;
}

int? _readInt(dynamic value) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}
