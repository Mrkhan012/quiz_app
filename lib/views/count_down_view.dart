import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testline/controller/count_down_controller.dart';
import 'package:testline/utils/colors.dart';

class CountdownScreen extends StatelessWidget {
  const CountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the CountdownController
    final CountdownController controller = Get.put(CountdownController());

    return Scaffold(
      backgroundColor: AppColor.tealColor,
      body: Center(
        child: Obx(() {
          return controller.isGoVisible.value
              ? AnimatedOpacity(
                  opacity: controller.isGoVisible.value ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: const Text(
                    "Go!",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : AnimatedOpacity(
                  opacity: controller.counter.value > 0 ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    '${controller.counter.value}',
                    style: const TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                );
        }),
      ),
    );
  }
}
