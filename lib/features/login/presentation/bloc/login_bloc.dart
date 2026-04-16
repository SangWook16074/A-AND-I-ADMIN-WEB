import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:aandi_auth/aandi_auth.dart';

import '../../../../app/api_error_feedback.dart';
import 'login_event.dart';
import 'login_state.dart';

part 'login_bloc.g.dart';

@riverpod
class LoginBloc extends _$LoginBloc {
  @override
  LoginState build() => const LoginState.initial();

  Future<void> onEvent(LoginEvent event) async {
    switch (event) {
      case LoginUsernameChanged(:final username):
        state = state.copyWith(
          username: username,
          submissionStatus: LoginSubmissionStatus.idle,
          clearError: true,
        );
      case LoginPasswordChanged(:final password):
        state = state.copyWith(
          password: password,
          submissionStatus: LoginSubmissionStatus.idle,
          clearError: true,
        );
      case LoginSubmitted():
        await _submit();
      case LoginSubmissionReset():
        state = state.copyWith(
          submissionStatus: LoginSubmissionStatus.idle,
          clearError: true,
        );
    }
  }

  Future<void> _submit() async {
    if (!state.canSubmit) {
      state = state.copyWith(
        submissionStatus: LoginSubmissionStatus.failure,
        errorMessage: '아이디와 비밀번호를 입력해주세요.',
      );
      return;
    }

    state = state.copyWith(
      submissionStatus: LoginSubmissionStatus.submitting,
      clearError: true,
    );

    try {
      final login = ref.read(loginUseCaseProvider);
      final session = await login(
        username: state.username,
        password: state.password,
      );
      if (session.user.role != AuthRole.admin) {
        state = state.copyWith(
          submissionStatus: LoginSubmissionStatus.failure,
          errorMessage: '관리자(ADMIN) 계정만 로그인할 수 있습니다.',
        );
        return;
      }
      state = state.copyWith(
        submissionStatus: LoginSubmissionStatus.success,
        clearError: true,
      );
    } on AuthApiException catch (e) {
      unawaited(showApiAlertIfPresent(e));
      state = state.copyWith(
        submissionStatus: LoginSubmissionStatus.failure,
        errorMessage: e.message,
      );
    } catch (_) {
      state = state.copyWith(
        submissionStatus: LoginSubmissionStatus.failure,
        errorMessage: '로그인에 실패했습니다.',
      );
    }
  }
}
