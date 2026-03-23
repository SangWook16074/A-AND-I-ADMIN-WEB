import '../../domain/entities/problem_test_cases.dart';

enum OjManagementStatus { idle, loading, success, failure }

class OjManagementState {
  const OjManagementState({
    required this.status,
    required this.problemTestCases,
    this.errorMessage,
  });

  const OjManagementState.initial()
    : status = OjManagementStatus.idle,
      problemTestCases = const [],
      errorMessage = null;

  final OjManagementStatus status;
  final List<ProblemTestCases> problemTestCases;
  final String? errorMessage;

  OjManagementState copyWith({
    OjManagementStatus? status,
    List<ProblemTestCases>? problemTestCases,
    String? errorMessage,
    bool clearError = false,
  }) {
    return OjManagementState(
      status: status ?? this.status,
      problemTestCases: problemTestCases ?? this.problemTestCases,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
