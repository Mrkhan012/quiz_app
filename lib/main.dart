import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testline/views/Quiz/quiz_home.dart';
import 'package:testline/views/Quiz/quiz_result.dart';
import 'package:testline/views/Quiz/quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => QuizHome()),
        GetPage(name: '/quiz', page: () => QuizScreen()),
        GetPage(name: '/result', page: () => QuizResult()),
      ],
    );
  }
}
