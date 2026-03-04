import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_nav_view_model.g.dart';

enum DashboardNavTab { usersManage, tasksManage }

@riverpod
class DashboardNavViewModel extends _$DashboardNavViewModel {
  @override
  DashboardNavTab build() => DashboardNavTab.usersManage;

  void selectTab(DashboardNavTab tab) {
    state = tab;
  }
}
