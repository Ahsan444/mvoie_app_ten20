import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mvoie_app_assignment/dashboard/controller/dashboard_controller.dart';

import '../../dashboard/widgets/dashboard_card_widget.dart';
import '../../dashboard/widgets/search_field.dart';
import '../../res/routes/route_name.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../../utils/fonts/AppDimensions.dart';
import '../../utils/fonts/font_weights.dart';
import '../controller/watch_controller.dart';
import '../widgets/search_card_widget.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  var dashboardController = Get.find<DashboardController>();
  var watchController = Get.find<WatchController>();

  @override
  void initState() {
    watchController.getWatchMovieData();
    watchController.dummyList.value = watchController.watchMovieModel.value.results??[];
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
                        child: watchController.isMovieSearchEnable.isTrue
                            ? Row(
                          children: [
                            Expanded(
                              child: SearchField(
                                controller:
                                watchController.searchController,
                                onCancel: () {
                                  watchController
                                      .isMovieSearchEnable.value = false;
                                  watchController.isSearchEnable.value = false;
                                  watchController.searchController
                                      .clear();
                                },
                                onChanged: (val) {

                                  if(watchController.searchController.text.isNotEmpty){
                                          watchController.isSearchEnable.value = true;
                                          //search in list
                                    watchController.searchResult.value = watchController.dummyList.where((user) => user.title!.toLowerCase().contains(watchController.searchController.text.toLowerCase())).toList();
                                    watchController.dummyList.value = watchController.searchResult;

                                        } else{
                                          watchController.isSearchEnable.value = false;
                                          watchController.dummyList.value = watchController.watchMovieModel.value.results??[];
                                        }
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
                                  watchController
                                      .isMovieSearchEnable.value = true;
                                },
                                padding: EdgeInsets.all(0),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                    //search widget
                    Obx(() {
                      return watchController.isSearchEnable.isTrue? Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    AppText(
                                      text: 'Top Results',
                                      fontSize: AppDimensions.FONT_SIZE_16,
                                      fontWeight: FontWeights.medium,
                                      color: Constants.COLOR1,
                                    ),
                                    const Divider(
                                      color: Constants.COLOR3,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: watchController
                                      .dummyList.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (_, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: SearchCardWidget(
                                        imageUrl:
                                        'https://image.tmdb.org/t/p/w500${watchController
                                            .dummyList.value[index]
                                            .backdropPath}',
                                        title: '${watchController.dummyList
                                            .value[index].title}',
                                        subtitle: '${watchController
                                            .dummyList[index].overview}',
                                        onTap: () {
                                          Get.toNamed(RouteName.movieDetailScreen,arguments: [watchController
                                              .dummyList[index]
                                              .backdropPath,watchController.dummyList
                                              [index].title,watchController
                                              .dummyList[index].originalTitle]);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) : const SizedBox.shrink();
                    }),
                    //movies Widget
                    Expanded(

                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Obx(() {
                          return watchController.watchMovieModel.value
                              .results?.length ==
                              null
                              ? const Center(
                            child: CircularProgressIndicator(
                              color: Constants.COLOR1,),
                          )
                              : watchController.isSearchEnable.isTrue
                              ? const SizedBox.shrink()
                              : GridView.builder(
                            gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                            itemCount: watchController
                                .watchMovieModel
                                .value
                                .results
                                ?.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              return DashboardCardWidget(
                                imagePath:
                                'https://image.tmdb.org/t/p/w500${watchController
                                    .watchMovieModel.value.results?[index]
                                    .backdropPath}',
                                movieName:
                                '${watchController.watchMovieModel.value
                                    .results?[index].title}',
                                isGridCard: true,
                              );
                            },
                          );
                        }),

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
