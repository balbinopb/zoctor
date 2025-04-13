import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoctor/controller/register_contoller.dart';
import 'package:zoctor/pages/widgets/RegisterPage/input_pasword_field.dart';
import 'package:zoctor/pages/widgets/RegisterPage/register_button.dart';
import 'package:zoctor/pages/widgets/RegisterPage/rounded_input_field.dart';


class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'REGISTER',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),

              RoundedInputField(
                hintText: 'First Name',
                icon: Icons.person,
                controller: controller.firstNameController,
              ),
              const SizedBox(height: 15),

              RoundedInputField(
                hintText: 'Last Name',
                icon: Icons.person,
                controller: controller.lastNameController,
              ),
              const SizedBox(height: 15),

              RoundedInputField(
                hintText: 'Email',
                icon: Icons.email,
                controller: controller.emailController,
              ),
              const SizedBox(height: 15),

              RoundedPasswordField(
                hintText: 'Password',
                controller: controller.passwordController,
              ),
              const SizedBox(height: 15),

              RoundedPasswordField(
                hintText: 'Confirm Password',
                controller: controller.confirmPasswordController,
              ),
              const SizedBox(height: 20),

              Obx(
                () =>
                    controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : RegisterButton(onPressed: controller.register),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text(
                      " Login",
                      style: TextStyle(color: Color.fromARGB(255, 0, 255, 195)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
