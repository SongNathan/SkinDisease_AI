import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면 크기를 동적으로 가져옴
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 화면 크기에 비례하여 컨테이너 크기 조정
    double containerWidth = screenWidth * 0.8; // 화면의 80% 크기
    double containerHeight = screenHeight * 0.8; // 화면의 80% 크기

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: containerWidth,
            height: containerHeight,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: screenWidth * 0.16, // 화면의 16%만큼 왼쪽 위치
                  top: screenHeight * 0.47, // 화면의 47%만큼 위쪽 위치
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'SKIN F',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontFamily: 'Kay Pho Du',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'OOO',
                          style: TextStyle(
                            color: Color(0xFFFF0D0D),
                            fontSize: 50,
                            fontFamily: 'Kay Pho Du',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'D',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontFamily: 'Kay Pho Du',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.68, // 화면의 68%만큼 왼쪽 위치
                  top: screenHeight * 0.41, // 화면의 41%만큼 위쪽 위치
                  child: Container(
                    width: screenWidth * 0.15, // 화면의 15% 크기
                    height: screenHeight * 0.15, // 화면의 15% 크기
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/skinfood_img.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
