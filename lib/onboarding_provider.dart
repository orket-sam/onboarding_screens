import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  PageController get pageController => _pageController;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setIndex(int val) {
    _currentIndex = val;
    _pageController.animateToPage(
      val,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    notifyListeners();
  }
}
