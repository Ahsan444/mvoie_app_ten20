import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvoie_app_assignment/watch/model/watch_movie_model.dart';

import '../../repository/watch_repo/watch_movie_repository.dart';
import '../../utils/utils.dart';

class WatchController extends GetxController{
  var watchMovieModel = WatchMovieModel().obs;
  var searchMovieList = WatchMovieModel().obs;
  var isMovieSearchEnable = false.obs;
  var searchController  = TextEditingController();
  final dashboardMovieRepo = WatchMovieRepository();
  var isSearchEnable = false.obs;
  var dummyList = <Results>[].obs;
  var searchResult = <Results>[].obs;


  Future<void> getWatchMovieData() async {

    dashboardMovieRepo.watchMovieApiData().then((value) {

      watchMovieModel.value = WatchMovieModel.fromJson(value);
      Get.back();

      debugPrint('>>>>>>watch movie data: ${watchMovieModel.value.results?.first.title}');
    }).onError((error, stackTrace) {
      // Get.back();
      debugPrint('-->exception: $error');
      Utils.appSnackBar(subtitle: 'Something went wrong', );
    });

  }

}