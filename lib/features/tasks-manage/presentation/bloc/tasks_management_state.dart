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
    this.selectedAssignment,
    this.assignmentSubmissionConfig,
    this.isLoadingDetails = false,
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
        selectedAssignment = null,
        assignmentSubmissionConfig = null,
        isLoadingDetails = false;

  final TasksManagementStatus status;
  final List<CourseSummary> courses;
  final bool isCreating;
  final bool isDeleting;
  final String? errorMessage;
  
  final CourseSummary? selectedCourse;
  final List<Enrollment>? selectedCourseEnrollments;
  final List<Assignment>? selectedCourseAssignments;
  final Assignment? selectedAssignment;
  final AssignmentSubmissionConfig? assignmentSubmissionConfig;
  final bool isLoadingDetails;

  TasksManagementState copyWith({
    TasksManagementStatus? status,
    List<CourseSummary>? courses,
    bool? isCreating,
    bool? isDeleting,
    String? errorMessage,
    CourseSummary? selectedCourse,
    List<Enrollment>? selectedCourseEnrollments,
    List<Assignment>? selectedCourseAssignments,
    Assignment? selectedAssignment,
    AssignmentSubmissionConfig? assignmentSubmissionConfig,
    bool? isLoadingDetails,
    bool clearError = false,
  }) {
    return TasksManagementState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      isCreating: isCreating ?? this.isCreating,
      isDeleting: isDeleting ?? this.isDeleting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      selectedCourse: selectedCourse ?? this.selectedCourse,
      selectedCourseEnrollments:
          selectedCourseEnrollments ?? this.selectedCourseEnrollments,
      selectedCourseAssignments:
          selectedCourseAssignments ?? this.selectedCourseAssignments,
      selectedAssignment: selectedAssignment ?? this.selectedAssignment,
      assignmentSubmissionConfig:
          assignmentSubmissionConfig ?? this.assignmentSubmissionConfig,
      isLoadingDetails: isLoadingDetails ?? this.isLoadingDetails,
    );
  }
}
