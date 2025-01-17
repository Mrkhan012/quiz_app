import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testline/views/Quiz/quiz_home.dart';
import 'package:testline/views/Quiz/quiz_result.dart';
import 'package:testline/views/Quiz/quiz_screen.dart';
import 'package:testline/views/splash_view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/quizHome', page: () => const QuizHome()),
        GetPage(name: '/quiz', page: () => const QuizScreen()),
        GetPage(name: '/result', page: () => const QuizResult()),
      ],
    );
  }
}
