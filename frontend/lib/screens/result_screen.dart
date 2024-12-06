import 'package:flutter/material.dart';
import 'dart:io';
import 'main_screen.dart'; // MainScreen 클래스가 정의된 파일 import

class ResultScreen extends StatelessWidget {
  final String result; // 진단 결과 텍스트
  final File image; // DiagnosisScreen에서 업로드한 이미지

  const ResultScreen({
    required this.result,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FC),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "SKIN F",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "OOO",
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
            SizedBox(height: screenHeight * 0.03),
            // 첫 번째 이미지 (작게 조정)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                image,
                height: screenHeight * 0.2,
                width: screenWidth * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            const Divider(
              thickness: 1.5,
              color: Colors.black26,
            ),
            SizedBox(height: screenHeight * 0.02),
            // 두 번째 이미지 (위로 올리고 크기 조정)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                image,
                height: screenHeight * 0.22,
                width: screenWidth * 0.45,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // 이미지 아래 간격 조정
            // 진단 결과 텍스트
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "진단 결과 : ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: result,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold, // 굵게 표시
                    ),
                  ),
                  TextSpan(
                    text: " 가 의심됩니다!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // 버튼들 (아래로 약간 이동)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 재촬영 버튼 클릭 시 이전 화면으로 돌아가기
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '재촬영',
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                      (route) => false, // MainScreen 외의 모든 화면 스택 제거
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '닫기',
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.07), // 버튼 아래 여백 증가
          ],
        ),
      ),
    );
  }
}
