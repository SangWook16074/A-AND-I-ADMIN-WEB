// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksCourseApiClientHash() =>
    r'e10fbd54e24eaed83256bf484e7fa4afd2c52da9';

/// See also [tasksCourseApiClient].
@ProviderFor(tasksCourseApiClient)
final tasksCourseApiClientProvider = Provider<CourseApiClient>.internal(
  tasksCourseApiClient,
  name: r'tasksCourseApiClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tasksCourseApiClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksCourseApiClientRef = ProviderRef<CourseApiClient>;
String _$tasksManagementRepositoryHash() =>
    r'6b8395fbb6abefacd8a01525b4ccee56ffb3614b';

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
String _$getCoursesUseCaseHash() => r'f942252eb457c66ab4baabf10b95604b4ddd6fe8';

/// See also [getCoursesUseCase].
@ProviderFor(getCoursesUseCase)
final getCoursesUseCaseProvider = Provider<GetCoursesUseCase>.internal(
  getCoursesUseCase,
  name: r'getCoursesUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCoursesUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCoursesUseCaseRef = ProviderRef<GetCoursesUseCase>;
String _$createCourseUseCaseHash() =>
    r'43d0bd5e282f3b02e3987dffc67924d85a44533b';

/// See also [createCourseUseCase].
@ProviderFor(createCourseUseCase)
final createCourseUseCaseProvider = Provider<CreateCourseUseCase>.internal(
  createCourseUseCase,
  name: r'createCourseUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createCourseUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CreateCourseUseCaseRef = ProviderRef<CreateCourseUseCase>;
String _$coursesHash() => r'349b00a90465bc5e5607ef63f04faa72a59e4acf';

/// See also [courses].
@ProviderFor(courses)
final coursesProvider =
    AutoDisposeProvider<AsyncValue<List<CourseSummary>>>.internal(
      courses,
      name: r'coursesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$coursesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CoursesRef = AutoDisposeProviderRef<AsyncValue<List<CourseSummary>>>;
String _$coursesNotifierHash() => r'c983bf15ad5b370d2631afb50874d29513ede619';

/// See also [CoursesNotifier].
@ProviderFor(CoursesNotifier)
final coursesNotifierProvider =
    AutoDisposeNotifierProvider<CoursesNotifier, CourseViewState>.internal(
      CoursesNotifier.new,
      name: r'coursesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$coursesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CoursesNotifier = AutoDisposeNotifier<CourseViewState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
