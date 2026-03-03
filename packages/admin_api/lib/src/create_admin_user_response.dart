import 'package:aandi_auth/aandi_auth.dart';

import 'admin_user_provision_type.dart';

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
      nickname: _readString(json, const ['nickname', 'nickName']),
      publicCode: _readString(json, const ['publicCode', 'public_code']),
      userTrack: _readString(json, const ['userTrack', 'user_track']),
      cohort: _readInt(json['cohort']),
      cohortOrder: _readInt(json['cohortOrder']),
      inviteLink: json['inviteLink'] as String?,
      expiresAt: json['expiresAt'] as String?,
      temporaryPassword: json['temporaryPassword'] as String?,
    );
  }

  final String id;
  final String username;
  final AuthRole role;
  final AdminUserProvisionType provisionType;
  final String? nickname;
  final String? publicCode;
  final String? userTrack;
  final int? cohort;
  final int? cohortOrder;
  final String? inviteLink;
  final String? expiresAt;
  final String? temporaryPassword;
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
