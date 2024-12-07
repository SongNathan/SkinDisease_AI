import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'loading_screen.dart';
import '../widgets/diagnosis_image_display.dart';
import '../widgets/diagnosis_buttons.dart';
import '../widgets/logo_widget.dart'; // LogoWidget 추가

class DiagnosisScreen extends StatefulWidget {
  const DiagnosisScreen({super.key});

  @override
  State<DiagnosisScreen> createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  File? _image;

  // 갤러리에서 이미지 선택
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // 분석 시작 버튼 클릭 시 LoadingScreen으로 이동
  void _startAnalysis() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoadingScreen(image: _image!),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('사진을 업로드하세요.')),
      );
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
          vertical: screenHeight * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // LogoWidget 사용
            const Center(child: LogoWidget()),
            SizedBox(height: screenHeight * 0.03),
            const Text(
              '사진을 등록해주세요',
              style: TextStyle(
                  color: Color(0xFF585858),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHeight * 0.02),
            // 이미지 업로드 위젯
            DiagnosisImageDisplay(
              image: _image,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(height: screenHeight * 0.02),
            // 버튼 위젯
            DiagnosisButtons(
              onPickImage: _pickImageFromGallery,
              onStartAnalysis: _startAnalysis,
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}
