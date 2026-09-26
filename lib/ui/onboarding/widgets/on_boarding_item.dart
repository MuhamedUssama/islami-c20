import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/ui/onboarding/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel item;
  const OnBoardingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(item.imagePath),
          const Spacer(),
          Text(
            item.title,
            textAlign: .center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: .bold,
              color: ColorsManager.goldColor,
            ),
          ),
          const Spacer(),
          if (item.body != null) ...{
            Text(
              item.body!,
              textAlign: .center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: .bold,
                color: ColorsManager.goldColor,
              ),
            ),
            const Spacer(),
          },
        ],
      ),
    );
  }
}
