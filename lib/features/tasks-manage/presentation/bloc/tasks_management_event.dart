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

  const factory TasksManagementEvent.publishAssignmentRequested({
    required String courseSlug,
    required String assignmentId,
  }) = TasksManagementPublishAssignmentRequested;

  const factory TasksManagementEvent.deliverAssignmentRequested({
    required String courseSlug,
    required String assignmentId,
  }) = TasksManagementDeliverAssignmentRequested;

  const factory TasksManagementEvent.courseDeletedRequested({
    required String courseSlug,
  }) = TasksManagementCourseDeletedRequested;

  const factory TasksManagementEvent.updateCourseRequested({
    required String courseSlug,
    required UpdateCourseRequest request,
  }) = TasksManagementUpdateCourseRequested;

  const factory TasksManagementEvent.assignmentDetailsRequested({
    required String courseSlug,
    required String assignmentId,
  }) = TasksManagementAssignmentDetailsRequested;

  const factory TasksManagementEvent.assignmentDeletedRequested({
    required String courseSlug,
    required String assignmentId,
  }) = TasksManagementAssignmentDeletedRequested;

  const factory TasksManagementEvent.updateAssignmentRequested({
    required String courseSlug,
    required String assignmentId,
    required UpdateAssignmentRequest request,
  }) = TasksManagementUpdateAssignmentRequested;
}
