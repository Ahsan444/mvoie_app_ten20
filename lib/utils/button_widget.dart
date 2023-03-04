import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvoie_app_assignment/utils/constants.dart';

import 'app_text.dart';
import 'fonts/AppDimensions.dart';
import 'fonts/font_weights.dart';

class ButtonWidget extends StatelessWidget {
  final bool show;
  final VoidCallback? onTap;
  final String? title;
  const ButtonWidget({Key? key, this.show =false,this.onTap,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      decoration: BoxDecoration(
        color: show ? Constants.COLOR4 : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: show
            ? const Border()
            : const Border(
          top: BorderSide(width: 1.0, color: Constants.COLOR4),
          left: BorderSide(width: 1.0, color: Constants.COLOR4),
          right: BorderSide(width: 1.0, color: Constants.COLOR4),
          bottom: BorderSide(width: 1.0, color: Constants.COLOR4),
        ),
      ),
      alignment: Alignment.center,
      child: TextButton(
        onPressed:onTap?? () {

          debugPrint('Get Tickets');
        },
        child: show
            ? AppText(
          text:title??"Get Tickets",
          textAlign: TextAlign.center,
          fontSize: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeights.medium,
          overflow: TextOverflow.ellipsis,
          color: Constants.COLOR2,
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_arrow,
              color: Constants.COLOR2,
            ),
            SizedBox(width: 10.w),
            const AppText(
              text:"Watch Trailer",
              textAlign: TextAlign.center,
              fontSize: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeights.medium,
              overflow: TextOverflow.ellipsis,
              color: Constants.COLOR2,
            ),
          ],
        ),
      ),
    );
  }
}
