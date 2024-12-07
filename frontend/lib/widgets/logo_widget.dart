import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'SKIN F',
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.08,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'OOO',
            style: TextStyle(
              color: Colors.red,
              fontSize: screenWidth * 0.08,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'D',
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.08,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
