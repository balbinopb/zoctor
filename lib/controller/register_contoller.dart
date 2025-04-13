import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoctor/services/auth.dart';

class RegisterController extends GetxController {
  final AuthServices _authServices = AuthServices();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();
    final name =
        '${firstNameController.text.trim()} ${lastNameController.text.trim()}';

    if (password != confirm) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;

    try {
      final user = await _authServices.registerWithEmailAndPassword(
        email,
        password,
        name,
      );
      if (user != null) {
        Get.offAllNamed('/login');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Register Failed", e.message ?? "Unknown error");
    } finally {
      isLoading.value = false;
    }
  }
}
