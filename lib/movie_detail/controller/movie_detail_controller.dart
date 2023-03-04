
import 'package:get/get.dart';

class MovieDetailController extends GetxController{
  var data  = Get.arguments;
  RxString? title = ''.obs;
  RxString? subTitle = ''.obs;
  RxString? img = ''.obs;


  @override
  void onInit() {
   if(data !=null){
     title?.value = data[1];
     subTitle?.value = data[2];
     img?.value = data[0];
   }else{
     title?.value = 'Watch';
     img?.value = '';
     subTitle?.value = 'In Theaters December 22,2022';
     print('data is null');
   }
    super.onInit();
  }
}