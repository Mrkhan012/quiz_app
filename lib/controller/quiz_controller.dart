// ignore_for_file: avoid_print

import 'dart:async';
import 'package:get/get.dart';
import '../model/quiz_model.dart';
import '../services/quiz_service.dart';

class QuizController extends GetxController {
  final QuizService _quizService = QuizService();
  var quiz = Rxn<QuizModel>();
  var currentQuestionIndex = 0.obs;
  var selectedAnswers = <int>[].obs;
  var score = 0.obs;
  var remainingTime = 0.obs;
  Timer? _timer; // Make the timer nullable

  @override
  void onInit() {
    super.onInit();
    fetchQuizData();
  }

  Future<void> fetchQuizData() async {
    final fetchedQuiz = await _quizService.fetchQuiz();
    if (fetchedQuiz != null) {
      quiz.value = fetchedQuiz;
      remainingTime.value = (quiz.value!.duration! * 60);
      startTimer();
    } else {
      // Handle case where quiz data is not fetched properly
      print("Failed to fetch quiz data");
    }
  }

  void startTimer() {
    // Initialize the timer only if it's not already initialized
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        finishQuiz();
      }
    });
  }

  String get formattedTime {
    int minutes = remainingTime.value ~/ 60;
    int seconds = remainingTime.value % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void answerQuestion(int selectedIndex) {
    if (quiz.value == null) return;

    if (selectedAnswers.length <= currentQuestionIndex.value) {
      selectedAnswers.addAll(List.filled(
          currentQuestionIndex.value - selectedAnswers.length + 1, -1));
    }

    selectedAnswers[currentQuestionIndex.value] = selectedIndex;

    bool isCorrect = quiz.value!.questions![currentQuestionIndex.value]
        .options[selectedIndex].isCorrect;

    if (isCorrect) {
      score.value++;
    }
  }

  int getCorrectAnswerIndex() {
    if (quiz.value == null) return -1;

    return quiz.value!.questions![currentQuestionIndex.value].options
        .indexWhere((option) => option.isCorrect);
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < quiz.value!.questions!.length - 1) {
      currentQuestionIndex.value++;
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
    }
  }

  void finishQuiz() {
    _timer?.cancel(); 
    Get.toNamed('/result');
  }

  @override
  void onClose() {
    _timer?.cancel(); 
    super.onClose();
  }
}
