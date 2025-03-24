import 'package:mobx/mobx.dart';

part 'task_navigaton_store.g.dart';

// ignore: library_private_types_in_public_api
class TaskNavigationStore = _TaskNavigationStore with _$TaskNavigationStore;

abstract class _TaskNavigationStore with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }
}
