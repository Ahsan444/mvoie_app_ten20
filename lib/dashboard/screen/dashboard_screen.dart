import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../../utils/fonts/AppDimensions.dart';
import '../../utils/fonts/font_weights.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/dashboard_card_widget.dart';
import '../widgets/search_field.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    dashboardController.getDashboardMovieData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Container(
                        width: double.infinity,
                        height: 90,
                        color: Colors.white,
                        child: dashboardController.isSearchEnable.isTrue
                            ? Row(
                                children: [
                                  Expanded(
                                    child: SearchField(
                                      controller:
                                          dashboardController.searchController,
                                      onCancel: () {
                                        dashboardController
                                            .isSearchEnable.value = false;
                                        dashboardController.searchController
                                            .clear();
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AppText(
                                      text: 'Watch',
                                      fontSize: AppDimensions.FONT_SIZE_16,
                                      fontWeight: FontWeights.medium,
                                      color: Constants.COLOR1,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.search),
                                      color: Constants.COLOR1,
                                      onPressed: () {
                                        dashboardController
                                            .isSearchEnable.value = true;
                                      },
                                      padding: EdgeInsets.all(0),
                                    )
                                  ],
                                ),
                              ),
                      );
                    }),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Obx(() {
                            return dashboardController.dashboardMovieModel.value
                                        .results?.length ==
                                    null
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Constants.COLOR1,
                                    ),
                                  )
                                : ListView.builder(
                                  itemCount: dashboardController
                                      .dashboardMovieModel
                                      .value
                                      .results
                                      ?.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (_, int index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: DashboardCardWidget(
                                        imagePath:
                                            'https://image.tmdb.org/t/p/w500${dashboardController.dashboardMovieModel.value.results?[index].backdropPath}',
                                        movieName:
                                            '${dashboardController.dashboardMovieModel.value.results?[index].originalTitle}',
                                      ),
                                    );
                                  },
                                );
                          })
                          //DashboardCardWidget(),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
