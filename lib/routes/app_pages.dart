import 'package:get/get.dart';
import 'package:zoctor/bindings/login_binding.dart';
import 'package:zoctor/bindings/register_binding.dart';
import 'package:zoctor/pages/home_page.dart';
import 'package:zoctor/pages/login_page.dart';
import 'package:zoctor/pages/onboarding_page_one.dart';
import 'package:zoctor/pages/onboarding_page_two.dart';
import 'package:zoctor/pages/register_page.dart';
import 'package:zoctor/routes/app_routes.dart';

class AppPages {
  static const initial = AppRoutes.onboarding1;

  static final routes = [
    GetPage(
      name: AppRoutes.onboarding1,
      page: () => const OnboardingPageOne(),
    ),
    GetPage(
      name: AppRoutes.onboarding2,
      page: () => const OnboardingPageTwo(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding()
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
  ];
}
