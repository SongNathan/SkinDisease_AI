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

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 왼쪽, 오른쪽 여백 추가
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3열로 설정
          crossAxisSpacing: screenWidth * 0.02, // 가로 간격
          mainAxisSpacing: screenHeight * 0.02, // 세로 간격
          childAspectRatio: 2, // 비율을 2로 설정하여 버튼이 가로로 길게 보이도록 함
        ),
        itemCount: categories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
            decoration: AppStyles.boxDecoration(screenWidth),
            child: Text(
              categories[index],
              style: AppStyles.categoryTextStyle(screenWidth),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
