//material import하기 :일관된 디자인 가이드라인
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skin Disease App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Scaffold : 앱 화면에 다양한 요소들을 배치
    return Scaffold(
      appBar: AppBar(title: const Text('Skin Disease App')),
      body: const Center(
        child: Column(
          children: <Widget>[Text('Hello!!'), Text('Hello!!'), Text('Hello!!')],
        ), //Column 위젯은 요소들을 세로로 배치하는 기능
      ),
    );
  }
}
