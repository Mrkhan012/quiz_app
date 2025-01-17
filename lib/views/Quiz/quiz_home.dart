import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testline/controller/quiz_controller.dart';
import 'package:testline/utils/colors.dart';
import 'package:testline/utils/dubg_tools.dart';
import 'package:testline/utils/text_styles.dart';
import 'package:testline/views/count_down_view.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  QuizController controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isLightTheme(context) ? AppColor.pureBlackColor : AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.tealColor,
        title: Text(
          "Quiz App",
          style: AppTextStyle.iMedium.copyWith(
            fontSize: 16,
            color: isLightTheme(context)
                ? AppColor.pureBlackColor
                : AppColor.whiteColor,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.quiz.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                controller.quiz.value!.title ?? "",
                style: AppTextStyle.iBold.copyWith(
                  fontSize: 16,
                  color: isLightTheme(context)
                      ? AppColor.whiteColor
                      : AppColor.pureBlackColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(controller.quiz.value!.description ?? "",
                  style: AppTextStyle.iBold.copyWith(
                    fontSize: 16,
                    color: isLightTheme(context)
                        ? AppColor.whiteColor
                        : AppColor.pureBlackColor,
                  ),
                  textAlign: TextAlign.center),
              ElevatedButton(
                  onPressed: () => _startQuizWithAnimation(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.currentQuestionIndex.value <
                            controller.quiz.value!.questions!.length - 1
                        ? AppColor.tealColor
                        : Colors.grey,
                  ),
                  child: Text(
                    "Start Quiz",
                    style: AppTextStyle.iBold.copyWith(
                      fontSize: 16,
                      color: isLightTheme(context)
                          ? AppColor.pureBlackColor
                          : AppColor.whiteColor,
                    ),
                  )),
            ],
          ),
        );
      }),
    );
  }

  void _startQuizWithAnimation(BuildContext context) {
    // Navigate to the next screen after the countdown animation
    Get.to(() => const CountdownScreen());
  }
}
