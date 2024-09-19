// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseState {
  final int currentIndex;
  BaseState({
    this.currentIndex = 0,
  });

  BaseState copyWith({
    int? currentIndex,
  }) {
    return BaseState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class BaseController extends StateNotifier<BaseState> {
  BaseController() : super(BaseState());

  void onIndexChanged(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

final baseControllerProvider =
    StateNotifierProvider.autoDispose<BaseController, BaseState>((ref) {
  return BaseController();
});
