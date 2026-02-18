import 'package:aandi_auth/aandi_auth.dart';

class AdminUser {
  const AdminUser({
    required this.id,
    required this.username,
    required this.role,
    this.forcePasswordChange,
    this.inviteLink,
    this.inviteExpiresAt,
    this.active,
  });

  final String id;
  final String username;
  final AuthRole role;
  final bool? forcePasswordChange;
  final String? inviteLink;
  final String? inviteExpiresAt;
  final bool? active;
}
