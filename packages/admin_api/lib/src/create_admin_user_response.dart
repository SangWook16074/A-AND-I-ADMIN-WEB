import 'package:aandi_auth/aandi_auth.dart';

import 'admin_user_provision_type.dart';

class CreateAdminUserResponse {
  const CreateAdminUserResponse({
    required this.id,
    required this.username,
    required this.role,
    required this.provisionType,
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
      inviteLink: json['inviteLink'] as String?,
      expiresAt: json['expiresAt'] as String?,
      temporaryPassword: json['temporaryPassword'] as String?,
    );
  }

  final String id;
  final String username;
  final AuthRole role;
  final AdminUserProvisionType provisionType;
  final String? inviteLink;
  final String? expiresAt;
  final String? temporaryPassword;
}
