import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/dashboard_repo/dashboard_repo.dart';
import '../../utils/utils.dart';
import '../model/dashboard_movie_model.dart';

class DashboardController extends GetxController{
var isLoading = false.obs;
var isSearchEnable = false.obs;
var searchController = TextEditingController();
var dashboardMovieModel = DashboardMovieModel().obs;
final dashboardMovieRepo = DashboardRepository();


Future<void> getDashboardMovieData() async {

  dashboardMovieRepo.dashboardApiData().then((value) {

    dashboardMovieModel.value = DashboardMovieModel.fromJson(value);
    Get.back();

    debugPrint('>>>>>>select scheme data: ${dashboardMovieModel.value.results?.first.title}');
  }).onError((error, stackTrace) {
    // Get.back();
    debugPrint('-->exception: $error');
    Utils.appSnackBar(subtitle: 'Something went wrong', );
  });

}


}