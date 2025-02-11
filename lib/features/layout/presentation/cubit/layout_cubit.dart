import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  final PageController controller = PageController(initialPage: 0);
  int currentPageIndex = 0;
  void navigateTo(int index) {
    print(currentPageIndex);
    currentPageIndex = index;

    controller.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    emit(LayoutChangeState());
  }

  void navigateToNextPage() {
    controller.animateToPage(
      ++currentPageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    emit(LayoutChangeState());
  }

  void navigateToPrevPage() {
    controller.animateToPage(
      --currentPageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    emit(LayoutChangeState());
  }

  @override
  Future<void> close() {
    controller.dispose(); // Clean up the PageController
    return super.close();
  }
}
