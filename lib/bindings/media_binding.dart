
import 'package:get/get.dart';
import 'package:mvoie_app_assignment/movie_detail/controller/movie_detail_controller.dart';




class MediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailController>(() => MovieDetailController());
  }
}
