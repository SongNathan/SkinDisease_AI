import 'package:flutter/material.dart';
import '../screens/diagnosis_screen.dart';
import '../styles/app_styles.dart';

class QuickDiagnosisButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const QuickDiagnosisButton({
    required this.screenWidth,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DiagnosisScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppStyles.buttonBackgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
        ),
        icon: const Icon(Icons.touch_app, color: Colors.black),
        label: Text(
          '빠른 진단 받기!!',
          style: AppStyles.buttonTextStyle(screenWidth),
        ),
      ),
    );
  }
}
