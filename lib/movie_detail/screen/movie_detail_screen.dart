import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/routes/route_name.dart';
import '../../utils/app_text.dart';
import '../../utils/button_widget.dart';
import '../../utils/constants.dart';
import '../../utils/fonts/AppDimensions.dart';
import '../../utils/fonts/font_weights.dart';
import '../controller/movie_detail_controller.dart';
import '../widget/chip_widget.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  // var data = Get.arguments;
  var mediaController = Get.put(MovieDetailController());
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.55,
              decoration:  BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${mediaController.img?.value}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.15,
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        SizedBox(width: 5.w),
                        Obx(() {
                          return AppText(
                            text: '${mediaController.title?.value}',
                            textAlign: TextAlign.center,
                            fontSize: AppDimensions.FONT_SIZE_16,
                            fontWeight: FontWeights.medium,
                            overflow: TextOverflow.ellipsis,
                            color: Constants.COLOR2,
                          );
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  Obx(() {
                    return AppText(
                      text: "${mediaController.subTitle?.value}",
                      textAlign: TextAlign.center,
                      fontSize: AppDimensions.FONT_SIZE_16,
                      fontWeight: FontWeights.medium,
                      overflow: TextOverflow.ellipsis,
                      color: Constants.COLOR2,
                    );
                  }),
                  SizedBox(height: size.height * 0.015),
                  //start button
                  ButtonWidget(
                      onTap: () {
                        Get.toNamed(RouteName.ticketScreen,arguments: mediaController.subTitle?.value);
                      },
                      show: true),
                  SizedBox(height: size.height * 0.015),
                  ButtonWidget(
                    show: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.015),
                  const AppText(
                    text: "Geners",
                    textAlign: TextAlign.center,
                    fontSize: AppDimensions.FONT_SIZE_16,
                    fontWeight: FontWeights.medium,
                    overflow: TextOverflow.ellipsis,
                    color: Constants.COLOR2,
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const ChipWidget(
                        text: 'Action',
                      ),
                      const ChipWidget(
                          text: 'Thriller', color: Constants.COLOR7),
                      const ChipWidget(
                          text: 'Science', color: Constants.COLOR8),
                      const ChipWidget(
                          text: 'Fiction', color: Constants.COLOR9),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  const AppText(
                    text: "Overview",
                    textAlign: TextAlign.center,
                    fontSize: AppDimensions.FONT_SIZE_16,
                    fontWeight: FontWeights.medium,
                    overflow: TextOverflow.ellipsis,
                    color: Constants.COLOR2,
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'As a collection of history\'s worst tyrants and\ncriminal masterminds gather to plot a war to\nwipe out millions, one man must race against\ntime to stop them. Discover the origins of the\nvery first independent intelligence agency in The\nKing\'s Man. The Comic Book “The Secret Service”\nby Mark Millar and Dave Gibbons.',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


