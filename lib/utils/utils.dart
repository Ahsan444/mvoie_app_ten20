import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  static appSnackBar(
      {String? title,
        subtitle,
        Color? bgColor,
        txtColor,
        SnackPosition? snackPosition}) {
    return Get.snackbar(
      title ?? 'Alert',
      subtitle ?? 'Please Select Type',
      snackPosition:snackPosition?? SnackPosition.TOP,
      backgroundColor: bgColor ?? Constants.RED_COLOR,
      colorText: txtColor ?? Colors.white,
    );
  }
}
