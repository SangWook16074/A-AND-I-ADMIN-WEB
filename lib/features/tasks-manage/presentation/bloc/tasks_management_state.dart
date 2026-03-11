import 'package:aandi_course_api/aandi_course_api.dart';

enum TasksManagementStatus { initial, loading, success, failure }

class TasksManagementState {
  const TasksManagementState({
    required this.status,
    required this.courses,
    required this.isCreating,
    this.isDeleting = false,
    this.errorMessage,
    this.selectedCourse,
    this.selectedCourseEnrollments,
    this.selectedCourseAssignments,
    this.isLoadingDetails = false,
    this.lastDeliveryResult,
  });

  const TasksManagementState.initial()
      : status = TasksManagementStatus.initial,
        courses = const [],
        isCreating = false,
        isDeleting = false,
        errorMessage = null,
        selectedCourse = null,
        selectedCourseEnrollments = null,
        selectedCourseAssignments = null,
        isLoadingDetails = false,
        lastDeliveryResult = null;

  final TasksManagementStatus status;
  final List<CourseSummary> courses;
  final bool isCreating;
  final bool isDeleting;
  final String? errorMessage;
  
  final CourseSummary? selectedCourse;
  final List<Enrollment>? selectedCourseEnrollments;
  final List<Assignment>? selectedCourseAssignments;
  final bool isLoadingDetails;
  final DeliverAssignmentResult? lastDeliveryResult;

  TasksManagementState copyWith({
    TasksManagementStatus? status,
    List<CourseSummary>? courses,
    bool? isCreating,
    bool? isDeleting,
    String? errorMessage,
    CourseSummary? selectedCourse,
    List<Enrollment>? selectedCourseEnrollments,
    List<Assignment>? selectedCourseAssignments,
    bool? isLoadingDetails,
    DeliverAssignmentResult? lastDeliveryResult,
    bool clearError = false,
    bool clearDeliveryResult = false,
  }) {
    return TasksManagementState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      isCreating: isCreating ?? this.isCreating,
      isDeleting: isDeleting ?? this.isDeleting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      selectedCourse: selectedCourse ?? this.selectedCourse,
      selectedCourseEnrollments: selectedCourseEnrollments ?? this.selectedCourseEnrollments,
      selectedCourseAssignments: selectedCourseAssignments ?? this.selectedCourseAssignments,
      isLoadingDetails: isLoadingDetails ?? this.isLoadingDetails,
      lastDeliveryResult: clearDeliveryResult ? null : (lastDeliveryResult ?? this.lastDeliveryResult),
    );
  }
}
