import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testline/utils/colors.dart';
import 'package:testline/controller/quiz_controller.dart';
import 'package:testline/utils/design_configuration/design_configuration.dart';
import 'package:testline/utils/dubg_tools.dart';
import 'package:testline/utils/text_styles.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({super.key});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  QuizController controller = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          title: Text(
            "Results",
            style: AppTextStyle.iBold.copyWith(
              fontSize: 16,
              color: isLightTheme(context)
                  ? AppColor.whiteColor
                  : AppColor.pureBlackColor,
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              DesignConfiguration.setJpgPath("trophy"),
            ),
            Text(
              "Your Score: ${controller.score.value}",
              style: AppTextStyle.iBold.copyWith(
                fontSize: 16,
                color: isLightTheme(context)
                    ? AppColor.whiteColor
                    : AppColor.pureBlackColor,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.offAllNamed('/'),
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.currentQuestionIndex.value <
                        controller.quiz.value!.questions!.length - 1
                    ? AppColor.tealColor
                    : AppColor.tealColor,
              ),
              child: Text(
                "Restart Quiz",
                style: AppTextStyle.iBold.copyWith(
                  fontSize: 16,
                  color: isLightTheme(context)
                      ? AppColor.pureBlackColor
                      : AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
