import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class GetEnrollmentsUseCase {
  Future<List<Enrollment>> call({required String courseSlug});
}

class GetEnrollmentsUseCaseImpl implements GetEnrollmentsUseCase {
  const GetEnrollmentsUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<List<Enrollment>> call({required String courseSlug}) {
    return _repository.getEnrollments(courseSlug: courseSlug);
  }
}
