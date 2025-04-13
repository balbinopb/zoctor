import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoctor/routes/app_routes.dart';
import 'package:zoctor/services/auth.dart';

class LoginController extends GetxController {
  final AuthServices _authServices = AuthServices();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  //ign in using email and password
  Future<void> signInWithEmailAndPassword() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Invalid Input", "Email and password cannot be empty");
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Invalid Email", "Please enter a valid email address");
      return;
    }

    isLoading.value = true;
    try {
      final user = await _authServices.signInWithEmailAndPassword(
        email,
        password,
      );
      if (user != null) {
        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      Get.snackbar("Login failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //ign in using Google
  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      final user = await _authServices.signInGoogle();
      if (user != null) {
        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      Get.snackbar("Google Sign-In failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
