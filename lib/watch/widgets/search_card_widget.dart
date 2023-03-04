import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../../utils/fonts/AppDimensions.dart';
import '../../utils/fonts/font_weights.dart';

class SearchCardWidget extends StatelessWidget {
  final String? imageUrl, title, subtitle;
  final VoidCallback? onTap;
  const SearchCardWidget({Key? key,this.imageUrl,this.title,this.subtitle,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100.w,
            width: 140.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl??'https://i0.wp.com/codemyui.com/wp-content/uploads/2016/09/project-deadline-progress-bar-animation.gif?fit=880%2C440&ssl=1'),
                fit: BoxFit.cover,
              ),
            ),

          ),
          Expanded(
            child: ListTile(
              title: AppText(
                text: title??'Movie Title',
                fontSize: AppDimensions.FONT_SIZE_16,
                fontWeight: FontWeights.medium,
                color: Constants.COLOR1,
                overflow:  TextOverflow.ellipsis,
              ),
              subtitle: AppText(
                text: subtitle??'Movie subtitle',
                fontSize: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeights.medium,
                color: Constants.COLOR3.withOpacity(0.8),
                overflow:  TextOverflow.ellipsis,
              ),
              trailing: const Icon(
                Icons.more_vert,
                color: Constants.COLOR6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
