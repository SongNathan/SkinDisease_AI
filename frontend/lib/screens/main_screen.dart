import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/disease_search_bar.dart';
import '../widgets/categories_widget.dart';
import '../widgets/diagnosis_button.dart';
import '../styles/app_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: LogoWidget()), // 로고 위젯
            SizedBox(height: screenHeight * 0.04),
            DiseaseSearchBar(
                screenWidth: screenWidth,
                screenHeight: screenHeight), // 검색 필드와 버튼
            SizedBox(height: screenHeight * 0.04),
            CategoriesWidget(
                screenWidth: screenWidth,
                screenHeight: screenHeight), // 카테고리 버튼
            SizedBox(height: screenHeight * 0.04),
            Text(
              '피부 질환 분석 시스템',
              style: AppStyles.subtitleStyle(screenWidth),
            ),
            SizedBox(height: screenHeight * 0.03),
            QuickDiagnosisButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight), // 빠른 진단 버튼
          ],
        ),
      ),
    );
  }
}
