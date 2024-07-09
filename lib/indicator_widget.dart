import 'package:flutter/material.dart';
import 'package:onboarding_app/onboarding_provider.dart';
import 'package:provider/provider.dart';

class IndicatorWidget extends StatelessWidget {
  final int index;
  const IndicatorWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(builder: (
      context,
      prov,
      child,
    ) {
      return GestureDetector(
        onTap: () => prov.setIndex(index),
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          duration: const Duration(milliseconds: 300),
          width: prov.currentIndex == index ? 13 : 10,
          height: prov.currentIndex == index ? 13 : 10,
          decoration: BoxDecoration(
            color: prov.currentIndex == index
                ? Colors.yellow
                : Colors.grey.shade400,
            shape: BoxShape.circle,
          ),
        ),
      );
    });
  }
}
