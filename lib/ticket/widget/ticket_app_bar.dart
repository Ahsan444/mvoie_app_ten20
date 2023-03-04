import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvoie_app_assignment/utils/fonts/AppDimensions.dart';

import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../../utils/fonts/font_weights.dart';

class TicketAppbar extends StatelessWidget {
  const TicketAppbar({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.w,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(
                text:title ??'The King\'s Man',
                fontWeight: FontWeights.medium,
                fontSize: AppDimensions.FONT_SIZE_18,
                color: Constants.COLOR1,
              ),
              SizedBox(height: 10.w),
            const  AppText(
                text: 'In Theaters December 22,2022',
                fontWeight: FontWeights.medium,
                fontSize: AppDimensions.FONT_SIZE_12,
                color: Constants.COLOR4,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}