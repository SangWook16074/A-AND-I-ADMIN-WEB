/// 관리자를 생성할 때 계정을 전달(provision)하는 방식을 나타냅니다.
enum AdminUserProvisionType {
  /// 초대 링크 기반으로 계정을 활성화합니다.
  invite,

  /// 임시 비밀번호를 발급해 계정을 전달합니다.
  password;

  /// 백엔드 API 계약에 맞는 enum 문자열로 변환합니다.
  String toApi() {
    return switch (this) {
      AdminUserProvisionType.invite => 'INVITE',
      AdminUserProvisionType.password => 'PASSWORD',
    };
  }
}
