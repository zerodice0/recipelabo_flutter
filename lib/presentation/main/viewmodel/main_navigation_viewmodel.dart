import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_navigation_viewmodel.g.dart';

@riverpod
class MainNavigationViewModel extends _$MainNavigationViewModel {
  @override
  int build() {
    return 0; // 기본값은 첫 번째 탭 (레시피 목록)
  }

  void setIndex(int index) {
    state = index;
  }
}
