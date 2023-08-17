import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
          'assets/animations/work_in_progress.json', // Replace this with your Lottie animation file path
          width: 1000, // Set the width and height of the animation as per your preference
          height: 1000,
          reverse: true
      )
    );
  }
}
