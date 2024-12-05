import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DiagnosisScreen extends StatefulWidget {
  const DiagnosisScreen({super.key});

  @override
  _DiagnosisScreenState createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  File? _image; // 선택한 이미지 파일을 저장할 변수

  // 이미지 선택을 위한 함수
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    // 갤러리에서 이미지를 선택
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // 선택한 이미지를 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('진단 화면'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 이미지가 선택되지 않은 경우 회색 배경과 + 표시
          _image == null
              ? Column(
                  children: [
                    Image.asset('assets/images/gray_picture.png'), // 회색 배경 이미지
                    const SizedBox(height: 8),
                    Image.asset('assets/images/red_plus.png'), // 빨간 + 이미지
                  ],
                )
              : Image.file(_image!), // 선택된 이미지가 있으면 그 이미지를 표시

          const SizedBox(height: 16),
          // 사진 업로드 버튼
          ElevatedButton(
            onPressed: _pickImage, // 사진 선택 함수 호출
            child: const Text('파일 업로드'),
          ),
          const SizedBox(height: 16),
          // 진단 받기 버튼
          ElevatedButton(
            onPressed: () {
              // 진단 받기 버튼을 누르면 결과 화면으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
            child: const Text('진단 받기'),
          ),
        ],
      ),
    );
  }
}

// 결과 화면
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('진단 결과'),
      ),
      body: const Center(
        child: Text('진단 결과가 표시됩니다!'),
      ),
    );
  }
}
