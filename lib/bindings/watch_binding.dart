import 'package:get/get.dart';

import '../watch/controller/watch_controller.dart';

class WatchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WatchController>(() => WatchController());
  }
}