import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoctor/core/app_palette.dart';
import 'package:zoctor/routes/app_routes.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  static const String _imagePath = 'assets/images/health.png';
  static const double _imageHeight = 250.0;
  static const double _buttonSize = 60.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Image.asset(_imagePath, height: _imageHeight),
            const SizedBox(height: 20),
            Text(
              'IMPROVE YOUR LIFESTYLE',
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Striving to improve community health care and practices',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppPalette.black,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.login),
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: AppPalette.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed(AppRoutes.onboarding2),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppPalette.tealAccent,
                    backgroundColor: AppPalette.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_buttonSize),
                      side: const BorderSide(color: AppPalette.tealAccent),
                    ),
                    minimumSize: const Size(_buttonSize, _buttonSize),
                  ),
                  child: const Icon(Icons.arrow_forward, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
