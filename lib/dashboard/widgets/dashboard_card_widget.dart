import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../../utils/fonts/AppDimensions.dart';
import '../../utils/fonts/font_weights.dart';

class DashboardCardWidget extends StatelessWidget {

  final String? movieName;
  final String? imagePath;
  final bool isGridCard;
  const DashboardCardWidget({Key? key,this.movieName,this.imagePath,this.isGridCard = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:isGridCard ? 110.w : 150,
      width:isGridCard ? 170.w : double.infinity,

      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imagePath??'https://i0.wp.com/codemyui.com/wp-content/uploads/2016/09/project-deadline-progress-bar-animation.gif?fit=880%2C440&ssl=1'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top:isGridCard ?70.w : 100.w,
            left: 16,
            child: AppText(text:movieName??'Movie Name',fontSize: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeights.medium,
              overflow: TextOverflow.ellipsis,
              color: Constants.COLOR2,),
          ),
        ],
      ),
    );
  }
}
