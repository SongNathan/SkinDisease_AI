import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'result_screen.dart'; // 결과 화면 import

class LoadingScreen extends StatelessWidget {
  final File image;

  const LoadingScreen({required this.image, super.key});

  // 서버로 이미지 전송 후 응답을 기다리는 함수
  Future<String> _sendImageToServer(File image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://SongNathan.pythonanywhere.com/test'),
      );
      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      } else {
        throw Exception('서버에 연결할 수 없습니다. 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('이미지 전송 중 오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FC),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: screenHeight * 0.05),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                image,
                height: screenHeight * 0.3,
                width: screenWidth * 0.6,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            const Text(
              "분석 중입니다. 잠시만 기다려 주세요...",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            FutureBuilder<String>(
              future: _sendImageToServer(image),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text(
                    '오류 발생: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  );
                }

                if (snapshot.hasData) {
                  // 서버에서 받은 결과를 ResultScreen으로 전달
                  final result = snapshot.data!;
                  Future.microtask(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          result: result,
                          image: image, // 업로드된 이미지 전달
                        ),
                      ),
                    );
                  });
                  return const SizedBox.shrink(); // 화면 전환 중 빈 공간 유지
                }

                return const Text('예기치 않은 오류가 발생했습니다.');
              },
            ),
          ],
        ),
      ),
    );
  }
}
