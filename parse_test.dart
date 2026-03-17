import 'dart:convert';
import 'packages/course_api/lib/src/course_models.dart';

void main() {
  final jsonStr = '''{
    "id": "69b7b5490c24eb788a35b6a4",
    "slug": "4rd-cs-test",
    "fieldTag": "NO",
    "startDate": "2026-03-02",
    "endDate": "2026-03-30",
    "metadata": {
      "title": "테스트 과정",
      "description": "기초 과정 테스트 입니다.",
      "phase": "CS",
      "attributes": {}
    },
    "status": "PUBLISHED",
    "createdAt": "2026-03-16T16:46:16+09:00",
    "updatedAt": "2026-03-16T16:46:16+09:00"
  }''';

  try {
    final map = jsonDecode(jsonStr);
    final summary = CourseSummary.fromJson(map);
    print('Success: ${summary.slug}');
  } catch (e, st) {
    print('Error: $e');
    print(st);
  }
}
