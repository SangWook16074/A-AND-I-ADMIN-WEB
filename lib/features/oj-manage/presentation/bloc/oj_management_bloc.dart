import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/oj_management_api_client.dart';
import '../../data/repositories/oj_management_repository_impl.dart';
import '../../domain/repositories/oj_management_repository.dart';
import 'oj_management_event.dart';
import 'oj_management_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'oj_management_bloc.g.dart';

@Riverpod(keepAlive: true)
OjManagementApiClient ojManagementApiClient(Ref ref) {
  return OjManagementApiClient(
    baseUrl: ref.watch(authBaseUrlProvider),
    dio: Dio(),
  );
}

@Riverpod(keepAlive: true)
OjManagementRepository ojManagementRepository(Ref ref) {
  return OjManagementRepositoryImpl(
    apiClient: ref.watch(ojManagementApiClientProvider),
    tokenStore: ref.watch(tokenStoreProvider),
  );
}

@riverpod
class OjManagementBloc extends _$OjManagementBloc {
  @override
  OjManagementState build() => const OjManagementState.initial();

  Future<void> onEvent(OjManagementEvent event) async {
    switch (event) {
      case OjManagementStarted():
        await loadAllData();
      case OjManagementRefreshRequested():
        await loadAllData();
      case OjManagementSubmissionsRefreshRequested():
        await loadSubmissions();
    }
  }

  Future<void> loadAllData() async {
    state = state.copyWith(
      status: OjManagementStatus.loading,
      clearError: true,
    );

    try {
      final testCases = await ref
          .read(ojManagementRepositoryProvider)
          .getTestCases();
      final submissions = await ref
          .read(ojManagementRepositoryProvider)
          .getSubmissions();

      state = state.copyWith(
        status: OjManagementStatus.success,
        problemTestCases: testCases,
        submissions: submissions,
      );
    } on OjManagementApiException catch (e) {
      state = state.copyWith(
        status: OjManagementStatus.failure,
        errorMessage: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        status: OjManagementStatus.failure,
        errorMessage: '데이터를 불러오지 못했습니다. 다시 시도해주세요.',
      );
    }
  }

  Future<void> loadSubmissions() async {
    if (state.status != OjManagementStatus.success) {
      state = state.copyWith(status: OjManagementStatus.loading);
    }

    try {
      final submissions = await ref
          .read(ojManagementRepositoryProvider)
          .getSubmissions();
      state = state.copyWith(
        status: OjManagementStatus.success,
        submissions: submissions,
      );
    } on OjManagementApiException catch (e) {
      state = state.copyWith(
        status: OjManagementStatus.failure,
        errorMessage: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        status: OjManagementStatus.failure,
        errorMessage: '제출 내역을 불러오지 못했습니다.',
      );
    }
  }
}
