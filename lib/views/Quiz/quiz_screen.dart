import 'dart:async'; // Add this import for Future.delayed
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testline/utils/colors.dart';
import 'package:testline/utils/dubg_tools.dart';
import 'package:testline/utils/text_styles.dart';
import '../../controller/quiz_controller.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizController controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // Show the exit confirmation dialog when the back button is pressed
        return await _showExitDialog(context) ?? false;
      },
      child: Scaffold(
        backgroundColor: AppColor.tealColor,
        appBar: AppBar(
          backgroundColor: AppColor.tealColor,
          title: Obx(() {
            return Center(
                child: Text(
              controller.formattedTime,
              style: AppTextStyle.iMedium.copyWith(
                fontSize: 18,
                color: isLightTheme(context)
                    ? AppColor.pureBlackColor
                    : AppColor.whiteColor,
              ),
            ));
          }),
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
        ),
        body: Obx(() {
          if (controller.quiz.value == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final question = controller
              .quiz.value!.questions![controller.currentQuestionIndex.value];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight * 0.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isLightTheme(context)
                        ? AppColor.whiteColor
                        : AppColor.blackColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          question.description,
                          style: AppTextStyle.iMedium.copyWith(
                            fontSize: 16,
                            color: isLightTheme(context)
                                ? AppColor.pureBlackColor
                                : AppColor.whiteColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...List.generate(
                          question.options.length,
                          (index) {
                            bool isSelected =
                                controller.selectedAnswers.length >
                                        controller.currentQuestionIndex.value &&
                                    controller.selectedAnswers[controller
                                            .currentQuestionIndex.value] ==
                                        index;

                            bool isCorrect = question.options[index].isCorrect;

                            Color backgroundColor = Colors.transparent;

                            if (isSelected) {
                              backgroundColor =
                                  isCorrect ? Colors.green : Colors.red;
                            } else if (controller.selectedAnswers.length >
                                    controller.currentQuestionIndex.value &&
                                isCorrect) {
                              backgroundColor = Colors.green;
                            }

                            String optionLabel = String.fromCharCode(
                                65 + index); // 'A' starts from 65 in ASCII

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (controller.selectedAnswers.length <=
                                      controller.currentQuestionIndex.value) {
                                    controller.answerQuestion(index);
                                    Future.delayed(const Duration(seconds: 6),
                                        () {
                                      controller.nextQuestion();
                                    });
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        optionLabel,
                                        style: AppTextStyle.iBold.copyWith(
                                          fontSize: 16,
                                          color: isLightTheme(context)
                                              ? AppColor.pureBlackColor
                                              : AppColor.whiteColor,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          question.options[index].description,
                                          style: AppTextStyle.iBold.copyWith(
                                            fontSize: 14,
                                            color: isLightTheme(context)
                                                ? AppColor.pureBlackColor
                                                : AppColor.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        if (controller.selectedAnswers.length >
                            controller.currentQuestionIndex.value)
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              controller.selectedAnswers[controller
                                          .currentQuestionIndex.value] ==
                                      question.options.indexWhere(
                                          (option) => option.isCorrect)
                                  ? "Correct Answer!"
                                  : "Correct answer is: ${question.options.firstWhere((option) => option.isCorrect).description}",
                              style: AppTextStyle.iBold.copyWith(
                                fontSize: 16,
                                color: controller.selectedAnswers[controller
                                            .currentQuestionIndex.value] ==
                                        question.options.indexWhere(
                                            (option) => option.isCorrect)
                                    ? Colors.green
                                    : Colors.greenAccent,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: controller.currentQuestionIndex.value > 0
                          ? controller.previousQuestion
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            controller.currentQuestionIndex.value > 0
                                ? AppColor.tealColor
                                : Colors.grey,
                      ),
                      child: Text(
                        "Previous",
                        style: AppTextStyle.iMedium.copyWith(
                          fontSize: 16,
                          color: isLightTheme(context)
                              ? AppColor.pureBlackColor
                              : AppColor.whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      "${controller.currentQuestionIndex.value + 1} / ${controller.quiz.value!.questions!.length}",
                      style: AppTextStyle.iBold.copyWith(
                        fontSize: 18,
                        color: isLightTheme(context)
                            ? AppColor.pureBlackColor
                            : AppColor.whiteColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: controller.currentQuestionIndex.value <
                              controller.quiz.value!.questions!.length - 1
                          ? controller.nextQuestion
                          : controller.finishQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.currentQuestionIndex.value <
                                controller.quiz.value!.questions!.length - 1
                            ? AppColor.tealColor
                            : Colors.grey,
                      ),
                      child: Text(
                        controller.currentQuestionIndex.value <
                                controller.quiz.value!.questions!.length - 1
                            ? "Next"
                            : "Finish",
                        style: AppTextStyle.iMedium.copyWith(
                          fontSize: 16,
                          color: isLightTheme(context)
                              ? AppColor.pureBlackColor
                              : AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              AppColor.tealColor, // Set the background color to teal

          title: const Text("Are you sure you want to exit the quiz?"),
          content: const Text("You will lose your progress."),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                "No",
                style: AppTextStyle.iMedium.copyWith(
                  fontSize: 16,
                  color: isLightTheme(context)
                      ? AppColor.pureBlackColor
                      : AppColor.whiteColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                "Yes",
                style: AppTextStyle.iMedium.copyWith(
                  fontSize: 16,
                  color: isLightTheme(context)
                      ? AppColor.pureBlackColor
                      : AppColor.whiteColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
