import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:http/http.dart' as http;

import '../../data/repositories/tasks_management_repository.dart';

part 'tasks_provider.g.dart';

@Riverpod(keepAlive: true)
AdminApiClient tasksAdminApiClient(Ref ref) {
  return AdminApiClient(
    baseUrl: ref.watch(authBaseUrlProvider),
    client: http.Client(),
  );
}

@Riverpod(keepAlive: true)
TasksManagementRepository tasksManagementRepository(Ref ref) {
  return TasksManagementRepository(
    apiClient: ref.watch(tasksAdminApiClientProvider),
    tokenStore: ref.watch(tokenStoreProvider),
  );
}

@riverpod
class CoursesNotifier extends _$CoursesNotifier {
  @override
  FutureOr<List<CourseSummary>> build() async {
    return _fetchCourses();
  }

  Future<List<CourseSummary>> _fetchCourses() async {
    final repository = ref.watch(tasksManagementRepositoryProvider);
    return await repository.getCourses();
  }

  Future<void> createCourse({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(tasksManagementRepositoryProvider);
      await repository.createCourse(
        slug: slug,
        title: title,
        description: description,
        phase: phase,
        targetTrack: targetTrack,
      );
      return _fetchCourses();
    });
  }
}
