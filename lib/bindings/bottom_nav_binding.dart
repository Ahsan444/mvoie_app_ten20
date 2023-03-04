import 'package:get/get.dart';
import 'package:mvoie_app_assignment/movie_detail/controller/movie_detail_controller.dart';

import '../BottomNavigation/controller/bottom_nav_controller.dart';
import '../dashboard/controller/dashboard_controller.dart';
import '../more/controller/more_controller.dart';
import '../watch/controller/watch_controller.dart';



class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<WatchController>(() => WatchController());
    Get.lazyPut<MoreController>(() => MoreController());
    Get.lazyPut<MovieDetailController>(() => MovieDetailController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
