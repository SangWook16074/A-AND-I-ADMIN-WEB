import 'package:aandi_auth/aandi_auth.dart';

import '../../domain/entities/admin_user.dart';

class AdminUserDto {
  const AdminUserDto({
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

  factory AdminUserDto.fromJson(Map<String, dynamic> json) {
    return AdminUserDto(
      id: (json['id'] ?? '').toString(),
      username: (json['username'] ?? '').toString(),
      role: AuthRole.fromApi((json['role'] ?? 'USER').toString()),
      nickname: json['nickname']?.toString(),
      publicCode: json['publicCode']?.toString(),
      userTrack: json['userTrack']?.toString(),
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

  AdminUser toDomain() {
    return AdminUser(
      id: id,
      username: username,
      role: role,
      nickname: nickname,
      publicCode: publicCode,
      userTrack: userTrack,
      cohort: cohort,
      cohortOrder: cohortOrder,
      forcePasswordChange: forcePasswordChange,
      inviteLink: inviteLink,
      inviteExpiresAt: inviteExpiresAt,
      active: active,
    );
  }
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
