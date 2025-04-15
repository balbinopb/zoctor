import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoctor/controller/login_controller.dart';
import 'package:zoctor/routes/app_routes.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isObscured = true.obs;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),

                // Email TextField
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Password TextField
                StatefulBuilder(
                  builder: (context, setState) {
                    return Obx(
                      () => TextField(
                        controller: controller.passwordController,
                        obscureText: isObscured.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscured.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              isObscured.value = !isObscured.value;
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Login Button or Loading
                controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.signInWithEmailAndPassword,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              color: Colors.tealAccent,
                              width: 4,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                const SizedBox(height: 20),
                const Divider(thickness: 1),
                const SizedBox(height: 10),

                // Google Sign-In Button
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Image.asset('assets/icons/google_icon.png'),
                    iconSize: 50,
                    onPressed: controller.signInWithGoogle,
                  ),
                ),

                const SizedBox(height: 20),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.register),
                      child: const Text(
                        " Register now",
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
