import '../../domain/entities/problem_test_cases.dart';
import '../../domain/entities/submission.dart';

enum OjManagementStatus { idle, loading, success, failure }

class OjManagementState {
  const OjManagementState({
    required this.status,
    required this.problemTestCases,
    required this.submissions,
    this.errorMessage,
  });

  const OjManagementState.initial()
    : status = OjManagementStatus.idle,
      problemTestCases = const [],
      submissions = const [],
      errorMessage = null;

  final OjManagementStatus status;
  final List<ProblemTestCases> problemTestCases;
  final List<Submission> submissions;
  final String? errorMessage;

  OjManagementState copyWith({
    OjManagementStatus? status,
    List<ProblemTestCases>? problemTestCases,
    List<Submission>? submissions,
    String? errorMessage,
    bool clearError = false,
  }) {
    return OjManagementState(
      status: status ?? this.status,
      problemTestCases: problemTestCases ?? this.problemTestCases,
      submissions: submissions ?? this.submissions,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
