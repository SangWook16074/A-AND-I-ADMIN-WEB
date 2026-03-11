import 'package:freezed_annotation/freezed_annotation.dart';

enum AuthRole {
  @JsonValue('USER')
  user,
  @JsonValue('ORGANIZER')
  organizer,
  @JsonValue('ADMIN')
  admin;

  static AuthRole fromApi(String role) {
    return switch (role.toUpperCase()) {
      'USER' => AuthRole.user,
      'ORGANIZER' => AuthRole.organizer,
      'ADMIN' => AuthRole.admin,
      _ => AuthRole.user,
    };
  }

  String toApi() {
    return switch (this) {
      AuthRole.user => 'USER',
      AuthRole.organizer => 'ORGANIZER',
      AuthRole.admin => 'ADMIN',
    };
  }
}
