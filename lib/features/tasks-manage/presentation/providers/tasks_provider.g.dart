// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksAdminApiClientHash() =>
    r'0a0d221af21291692fd0f644b97252af53a3ef94';

/// See also [tasksAdminApiClient].
@ProviderFor(tasksAdminApiClient)
final tasksAdminApiClientProvider = Provider<AdminApiClient>.internal(
  tasksAdminApiClient,
  name: r'tasksAdminApiClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tasksAdminApiClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksAdminApiClientRef = ProviderRef<AdminApiClient>;
String _$tasksManagementRepositoryHash() =>
    r'2fccbc32828bb06cfb71b4bc19beefbdc91bdf5e';

/// See also [tasksManagementRepository].
@ProviderFor(tasksManagementRepository)
final tasksManagementRepositoryProvider =
    Provider<TasksManagementRepository>.internal(
      tasksManagementRepository,
      name: r'tasksManagementRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$tasksManagementRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksManagementRepositoryRef = ProviderRef<TasksManagementRepository>;
String _$coursesNotifierHash() => r'36f72fdfea412b37af69b306856ce5e3d62fc9b4';

/// See also [CoursesNotifier].
@ProviderFor(CoursesNotifier)
final coursesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      CoursesNotifier,
      List<CourseSummary>
    >.internal(
      CoursesNotifier.new,
      name: r'coursesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$coursesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CoursesNotifier = AutoDisposeAsyncNotifier<List<CourseSummary>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
