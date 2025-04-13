import 'package:flutter/material.dart';
import 'package:zoctor/core/app_palette.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              color: AppPalette.tealAccent,
              width: 4,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        ),
        child: const Text(
          'REGISTER',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
