import 'package:aandi_auth/aandi_auth.dart';

class AdminUserSummary {
  const AdminUserSummary({
    required this.id,
    required this.username,
    required this.role,
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
      forcePasswordChange: json['forcePasswordChange'] as bool?,
      inviteLink: json['inviteLink'] as String?,
      inviteExpiresAt: json['inviteExpiresAt'] as String?,
      active: json['active'] as bool?,
    );
  }

  final String id;
  final String username;
  final AuthRole role;
  final bool? forcePasswordChange;
  final String? inviteLink;
  final String? inviteExpiresAt;
  final bool? active;
}
