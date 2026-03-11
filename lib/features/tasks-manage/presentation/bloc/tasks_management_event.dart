import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_management_event.freezed.dart';

@freezed
sealed class TasksManagementEvent with _$TasksManagementEvent {
  const factory TasksManagementEvent.started() = TasksManagementStarted;

  const factory TasksManagementEvent.refreshRequested() = TasksManagementRefreshRequested;

  const factory TasksManagementEvent.courseSelected(CourseSummary course) = TasksManagementCourseSelected;

  const factory TasksManagementEvent.enrollmentsRequested(String courseSlug) = TasksManagementEnrollmentsRequested;

  const factory TasksManagementEvent.createWeekRequested({
    required String courseSlug,
    required int weekNo,
    required String title,
    required String startDate,
    required String endDate,
  }) = TasksManagementCreateWeekRequested;

  const factory TasksManagementEvent.createCourseRequested({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
    required String startDate,
    required String endDate,
  }) = TasksManagementCreateCourseRequested;

  const factory TasksManagementEvent.assignmentsRequested({
    required String courseSlug,
    int? weekNo,
    String? status,
  }) = TasksManagementAssignmentsRequested;

  const factory TasksManagementEvent.createAssignmentRequested({
    required String courseSlug,
    required CreateAssignmentRequest request,
  }) = TasksManagementCreateAssignmentRequested;
}
