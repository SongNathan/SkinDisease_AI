import 'package:flutter/material.dart';
import '/screens/launch_screen.dart'; // launch_screen.dart 파일을 import
import '/screens/main_screen.dart'; // launch_screen.dart 파일을 import

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const LaunchScreen(), // LaunchScreen을 첫 번째 화면으로 설정
      routes: {
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
