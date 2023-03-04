import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvoie_app_assignment/utils/app_images.dart';

import '../../res/routes/route_name.dart';
import '../../ticket/widget/ticket_app_bar.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../../utils/fonts/AppDimensions.dart';
import '../../utils/fonts/font_weights.dart';
import '../../utils/utils.dart';
import '../../watch/controller/watch_controller.dart';


class PayScreen extends StatelessWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var watchController = Get.find<WatchController>();
    return Scaffold(
        body: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
             const TicketAppbar(),
              SizedBox(height: 40.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(AppImages.MOBILE_MAP,width: size.width,),
              ),
              SizedBox(height: 20.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40.w,
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constants.COLOR2,
                      boxShadow: [
                        BoxShadow(
                          color: Constants.COLOR3.withOpacity(0.3),
                          blurRadius: 1,
                          offset: const  Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add,color: Colors.black ,),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 40.w,
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    margin:  EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constants.COLOR2,
                      boxShadow: [
                        BoxShadow(
                          color: Constants.COLOR3.withOpacity(0.3),
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.remove,color: Colors.black ,),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: Constants.COLOR3.withOpacity(0.5),
                  thickness: 5,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7.w),
                      Row(
                        children: [
                          Image.asset(AppImages.SEAT_ICON,width: 25.w,
                            color: Constants.COLOR9,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.w),
                            child: const  AppText(text:'Selected',
                              fontSize: AppDimensions.FONT_SIZE_12,
                              fontWeight: FontWeights.medium,
                              color: Constants.COLOR3,
                            ),
                          ),
                         const Spacer(),
                          Image.asset(AppImages.SEAT_ICON,width: 25.w,
                            color: Constants.COLOR3,),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8.w),
                          child: const  AppText(text:'Not available',
                              fontSize: AppDimensions.FONT_SIZE_12,
                              fontWeight: FontWeights.medium,
                              color: Constants.COLOR3,
                            ),
                        ),
                        ],
                      ),
                      SizedBox(height: 20.w),
                      Row(
                        children: [
                          Image.asset(AppImages.SEAT_ICON,width: 25.w,
                            color: Constants.COLOR8,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.w),
                            child: const  AppText(text:'VIP(150\$)',
                              fontSize: AppDimensions.FONT_SIZE_12,
                              fontWeight: FontWeights.medium,
                              color: Constants.COLOR3,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(AppImages.SEAT_ICON,width: 25.w,
                            color: Constants.COLOR4,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.w),
                            child: const  AppText(text:'Regular(50\$)',
                              fontSize: AppDimensions.FONT_SIZE_12,
                              fontWeight: FontWeights.medium,
                              color: Constants.COLOR3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: 90.w,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Constants.COLOR3.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            AppText(text:' 4/3row ',
                              fontSize: AppDimensions.FONT_SIZE_12,
                              color: Constants.COLOR1,
                              fontWeight: FontWeights.medium,),
                             Icon(Icons.clear,color:Colors.black,size: 15,),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          priceButton1(size),
                          payButton(size,(){
                            Utils.appSnackBar(subtitle: 'Payment Successful',title: 'Success',bgColor: Colors.green,);
                            Future.delayed(const Duration(seconds: 1), () {
                              Get.offAllNamed(
                                RouteName.bottomNavigationScreen,
                              );
                              watchController.isSearchEnable.value = false;
                              watchController.searchController.clear();
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

Widget payButton(var size, VoidCallback? onPressed){
  return Container(
    width: size.height * 0.25,
    decoration:const BoxDecoration(
      color:  Constants.COLOR4,
      borderRadius:  BorderRadius.all(Radius.circular(10)),
    ),
    alignment: Alignment.center,
    child: TextButton(
      onPressed: onPressed,
      child:  Text(
        "Proceed to pay",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ),
  );
}
Widget priceButton1( var size){
  return  Container(
    width: size.width * 0.3,
    padding: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: Constants.COLOR3.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Total Price',
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,

          ),),
        Text('\$50',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,

          ),),

      ],
    ),
  );
}
