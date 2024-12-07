import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class DiseaseSearchBar extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const DiseaseSearchBar({
    required this.screenWidth,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: screenHeight * 0.06,
            decoration: AppStyles.boxDecoration(screenWidth),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.03),
                  child: Icon(Icons.search,
                      color: Colors.grey, size: screenWidth * 0.06),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '검색',
                  style: AppStyles.hintStyle(screenWidth),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Container(
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          decoration: AppStyles.boxDecoration(screenWidth),
          child: Icon(Icons.add, color: Colors.black, size: screenWidth * 0.06),
        ),
      ],
    );
  }
}
