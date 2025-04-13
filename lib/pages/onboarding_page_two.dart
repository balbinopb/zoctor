import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoctor/core/app_palette.dart';
import 'package:zoctor/routes/app_routes.dart';

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  //Function to create a transparent color with a given opacity
  Color transparentColor(Color baseColor, double opacity) {
    return baseColor.withValues(
      red: baseColor.r.toDouble(),
      green: baseColor.g.toDouble(),
      blue: baseColor.b.toDouble(),
      alpha: opacity * 255,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.white,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER SECTION
            Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    transparentColor(AppPalette.tealAccent, 0.2),
                    transparentColor(AppPalette.white, 0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SKY HEALTH',
                      style: TextStyle(
                        fontSize: 32,
                        color: AppPalette.tealAccent,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'IMPROVE YOUR LIFESTYLE',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppPalette.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Striving to improve\ncommunity health\ncare and practices',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: AppPalette.black54,
                      ),
                    ),
                    const SizedBox(height: 36),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPalette.black,
                        foregroundColor: AppPalette.tealAccent,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: AppPalette.tealAccent,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: const Icon(Icons.arrow_forward, size: 30),
                    ),
                  ],
                ),
              ),
            ),

            // IMAGE SECTION
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/health.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
