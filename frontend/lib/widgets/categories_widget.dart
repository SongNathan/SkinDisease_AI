import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class CategoriesWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const CategoriesWidget({
    required this.screenWidth,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      '여드름',
      '주사염',
      '건선',
      '아토피',
      '두드러기',
      '피부암',
    ];

    return Wrap(
      spacing: screenWidth * 0.03,
      runSpacing: screenHeight * 0.02,
      children: categories
          .map(
            (category) => Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.015,
                horizontal: screenWidth * 0.05,
              ),
              decoration: AppStyles.boxDecoration(screenWidth),
              child: Text(
                category,
                style: AppStyles.categoryTextStyle(screenWidth),
              ),
            ),
          )
          .toList(),
    );
  }
}
