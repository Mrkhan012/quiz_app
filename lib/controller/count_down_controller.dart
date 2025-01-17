import 'dart:async';
import 'package:get/get.dart';

class CountdownController extends GetxController {
  var counter = 3.obs; 
  var isGoVisible = false.obs; 

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value > 1) {
        counter.value--;
      } else {
        timer.cancel();
        isGoVisible.value = true; 
        Future.delayed(const Duration(seconds: 1), () {
          Get.offNamed('/quiz');
        });
      }
    });
  }
}
