enum AdminUserProvisionType {
  invite,
  password;

  String toApi() {
    return switch (this) {
      AdminUserProvisionType.invite => 'INVITE',
      AdminUserProvisionType.password => 'PASSWORD',
    };
  }
}
