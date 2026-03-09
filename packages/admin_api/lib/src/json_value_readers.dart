/// 제공된 키 목록을 순회하며 첫 번째 유효한(비어있지 않은) 문자열 값을 반환합니다.
String? readFirstNonEmptyString(Map<String, dynamic> json, List<String> keys) {
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

/// 숫자 응답을 [int?]로 정규화합니다.
///
/// 서버 응답이 [int], [num], [String] 중 어떤 타입이어도 일관되게 처리합니다.
int? readIntOrNull(dynamic value) {
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
