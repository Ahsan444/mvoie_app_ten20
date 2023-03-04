import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvoie_app_assignment/utils/app_images.dart';
import 'package:mvoie_app_assignment/utils/fonts/AppDimensions.dart';
import 'package:mvoie_app_assignment/utils/fonts/font_weights.dart';

import '../../res/routes/route_name.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../widget/ticket_app_bar.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  var data = Get.arguments;
  var title;
  @override
  void initState() {
    title = data[0];
    print('title is $title');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TicketAppbar(title: '${title}',),
            SizedBox(height: 110.w),
            const Padding(
              padding:  EdgeInsets.all(15.0),
              child: AppText(
                text:'Date',
                fontSize: AppDimensions.FONT_SIZE_16,
                color: Constants.COLOR1,
                fontWeight: FontWeights.medium,
              ),
            ),
            SizedBox(
              height: 30.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 30.w,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Constants.COLOR4
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          index == 0
                              ? BoxShadow(
                                  color: Constants.COLOR4.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                )
                              : const BoxShadow(
                                  color: Colors.transparent,
                                ),
                        ],
                      ),
                      child: Text(
                        '5 Mar',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: index == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                     const AppText(
                        text:'12:30',
                        fontSize: AppDimensions.FONT_SIZE_12,
                        color: Constants.COLOR1,
                        fontWeight: FontWeights.medium,

                      ),
                      SizedBox(width: 10.w),
                      AppText(
                        text:'Cinetech + Hall 1',
                        fontSize: AppDimensions.FONT_SIZE_12,
                        color: Constants.COLOR1.withOpacity(0.5),
                        fontWeight: FontWeights.medium,

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 125.w,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemExtent: 220.w,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 125.w,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Constants.COLOR4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            AppImages.MOBILE_MAP,
                            height: 30.w,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.w),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 0),
                  child: Row(
                    children: [
                      AppText(
                        text:'From',
                        fontSize: AppDimensions.FONT_SIZE_12,
                        color: Constants.COLOR1.withOpacity(0.5),
                        fontWeight: FontWeights.medium,

                      ),

                      SizedBox(width: 5.w),
                    const  AppText(
                        text:'50\$',
                        fontSize: AppDimensions.FONT_SIZE_12,
                        color: Constants.COLOR1,
                        fontWeight: FontWeights.medium,

                      ),

                      SizedBox(width: 3.w),
                      AppText(
                        text:'or',
                        fontSize: AppDimensions.FONT_SIZE_12,
                        color: Constants.COLOR1.withOpacity(0.5),
                        fontWeight: FontWeights.medium,

                      ),
                      SizedBox(width: 3.w),
                      const  AppText(
                        text:'2500 bonus',
                        fontSize: AppDimensions.FONT_SIZE_12,
                        color: Constants.COLOR1,
                        fontWeight: FontWeights.medium,

                      ),
                    ],
                  ),
                ),
                SizedBox(height: 110.w),
                InkWell(
                  onTap: (){
                    Get.toNamed(RouteName.payScreen ,);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 50.w,
                      decoration: const BoxDecoration(
                        color: Constants.COLOR4,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: Alignment.center,
                      child: const AppText(
                        text:"Select Seats",
                        fontSize: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeights.semiBold,
                        color: Constants.COLOR2,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


