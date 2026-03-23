import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/oj_management_api_client.dart';
import '../../data/repositories/oj_management_repository_impl.dart';
import '../../domain/repositories/oj_management_repository.dart';
import 'oj_management_event.dart';
import 'oj_management_state.dart';

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
        await loadTestCases();
      case OjManagementRefreshRequested():
        await loadTestCases();
    }
  }

  Future<void> loadTestCases() async {
    state = state.copyWith(status: OjManagementStatus.loading, clearError: true);

    try {
      final data = await ref.read(ojManagementRepositoryProvider).getTestCases();
      state = state.copyWith(
        status: OjManagementStatus.success,
        problemTestCases: data,
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
}
