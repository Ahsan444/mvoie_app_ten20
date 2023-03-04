import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../movie_detail/widget/chip_widget.dart';
import '../../utils/app_text.dart';
import '../../utils/button_widget.dart';
import '../../utils/constants.dart';
import '../../utils/fonts/AppDimensions.dart';
import '../../utils/fonts/font_weights.dart';
import '../../utils/utils.dart';

class MediaLibScreen extends StatefulWidget {
  const MediaLibScreen({Key? key}) : super(key: key);

  @override
  State<MediaLibScreen> createState() => _MediaLibScreenState();
}

class _MediaLibScreenState extends State<MediaLibScreen> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.55,
              decoration:  const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://assets1.ignimgs.com/2019/09/30/the-kings-man-new-button-1569854451869.jpg'),
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
                        const AppText(
                          text: 'Watch',
                          textAlign: TextAlign.center,
                          fontSize: AppDimensions.FONT_SIZE_16,
                          fontWeight: FontWeights.medium,
                          overflow: TextOverflow.ellipsis,
                          color: Constants.COLOR2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                 const AppText(
                    text: "In Theaters December 22,2022",
                    textAlign: TextAlign.center,
                    fontSize: AppDimensions.FONT_SIZE_16,
                    fontWeight: FontWeights.medium,
                    overflow: TextOverflow.ellipsis,
                    color: Constants.COLOR2,
                  ),
                  SizedBox(height: size.height * 0.015),
                  //start button
                  ButtonWidget(
                      onTap: () {
                        Utils.appSnackBar(subtitle: 'We are working on it');
                      },
                      show: true),
                  SizedBox(height: size.height * 0.015),
               const   ButtonWidget(
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
