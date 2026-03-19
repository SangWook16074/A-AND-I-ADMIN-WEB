import 'package:aandi_course_api/aandi_course_api.dart';
import '../../../users-manage/domain/entities/admin_user.dart';

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
    this.isLoadingDetails = false,
    this.searchedUser,
    this.isSearchingUser = false,
    this.userNotFound = false,
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
        isLoadingDetails = false,
        searchedUser = null,
        isSearchingUser = false,
        userNotFound = false;

  final TasksManagementStatus status;
  final List<CourseSummary> courses;
  final bool isCreating;
  final bool isDeleting;
  final String? errorMessage;
  
  final CourseSummary? selectedCourse;
  final List<Enrollment>? selectedCourseEnrollments;
  final List<Assignment>? selectedCourseAssignments;
  final Assignment? selectedAssignment;
  final bool isLoadingDetails;
  final AdminUser? searchedUser;
  final bool isSearchingUser;
  final bool userNotFound;

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
    bool? isLoadingDetails,
    AdminUser? searchedUser,
    bool? isSearchingUser,
    bool? userNotFound,
    bool clearError = false,
    bool clearSearchedUser = false,
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
      isLoadingDetails: isLoadingDetails ?? this.isLoadingDetails,
      searchedUser: clearSearchedUser ? null : (searchedUser ?? this.searchedUser),
      isSearchingUser: isSearchingUser ?? this.isSearchingUser,
      userNotFound: userNotFound ?? this.userNotFound,
    );
  }
}
