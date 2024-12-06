import 'package:flutter/material.dart';
import 'diagnosis_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final categories = [
      '여드름',
      '주사염',
      '건선',
      '아토피',
      '두드러기',
      '피부암',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FC), // 배경색 설정
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 로고
            Center(
              child: Text.rich(
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
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            // 검색 필드와 버튼
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0EAFB),
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
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
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0EAFB),
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  child: Icon(Icons.add,
                      color: Colors.black, size: screenWidth * 0.06),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            // 카테고리 버튼들 (6개)
            Wrap(
              spacing: screenWidth * 0.03,
              runSpacing: screenHeight * 0.02,
              children: categories
                  .map(
                    (category) => Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0EAFB),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: screenHeight * 0.04),
            // 피부 질환 분석 시스템 텍스트
            Text(
              '피부 질환 분석 시스템',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: const Color(0xFF868181),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            // 빠른 진단 받기 버튼
            Center(
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
                  backgroundColor: const Color(0xFFF0EAFB),
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
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
