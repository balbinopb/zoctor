import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/HomePage/doctor_section.dart';
import 'widgets/HomePage/exercise_section.dart';
import 'widgets/HomePage/greeting_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName ?? 'User';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GreetingSection(),
              SizedBox(height: 20),
              DoctorSection(
                name: 'Dr. $name',
                profession: 'Heart Specialist',
                image: 'assets/images/alexa.png',
              ),
              SizedBox(height: 30),
              ExerciseSection(),
            ],
          ),
        ),
      ),
    );
  }
}
