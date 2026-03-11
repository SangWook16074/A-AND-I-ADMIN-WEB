import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_management_event.freezed.dart';

@freezed
sealed class TasksManagementEvent with _$TasksManagementEvent {
  const factory TasksManagementEvent.started() = TasksManagementStarted;

  const factory TasksManagementEvent.refreshRequested() = TasksManagementRefreshRequested;

  const factory TasksManagementEvent.createCourseRequested({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
    required String startDate,
    required String endDate,
  }) = TasksManagementCreateCourseRequested;
}
