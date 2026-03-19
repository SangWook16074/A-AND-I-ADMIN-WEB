import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AddEnrollmentRequest serializes with publicCode', () {
    const request = AddEnrollmentRequest(publicCode: 'PUB-001');

    expect(request.toJson(), {'publicCode': 'PUB-001'});
    expect(
      AddEnrollmentRequest.fromJson({'publicCode': 'PUB-001'}),
      const AddEnrollmentRequest(publicCode: 'PUB-001'),
    );
  });
}
