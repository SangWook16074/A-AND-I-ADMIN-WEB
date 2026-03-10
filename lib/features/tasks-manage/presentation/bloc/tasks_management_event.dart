sealed class TasksManagementEvent {
  const TasksManagementEvent();
}

class TasksManagementStarted extends TasksManagementEvent {
  const TasksManagementStarted();
}

class TasksManagementRefreshRequested extends TasksManagementEvent {
  const TasksManagementRefreshRequested();
}

class TasksManagementCreateCourseRequested extends TasksManagementEvent {
  const TasksManagementCreateCourseRequested({
    required this.slug,
    required this.title,
    this.description,
    required this.phase,
    required this.targetTrack,
    required this.startDate,
    required this.endDate,
  });

  final String slug;
  final String title;
  final String? description;
  final String phase;
  final String targetTrack;
  final String startDate;
  final String endDate;
}
