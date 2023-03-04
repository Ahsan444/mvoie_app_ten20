
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../res/routes/route_name.dart';

class SplashController extends GetxController{
  late final AnimationController controller;

  void moveToDashBoard() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(
        RouteName.bottomNavigationScreen,
      );
    });
  }


}