import 'package:get/get.dart';
import 'package:mvoie_app_assignment/splash/controller/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());

  }
}
