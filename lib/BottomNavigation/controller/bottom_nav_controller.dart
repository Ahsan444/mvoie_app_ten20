import 'package:get/get.dart';

import '../../dashboard/screen/dashboard_screen.dart';
import '../../media_lib/screen/media_lib_screen.dart';
import '../../more/screen/more_screen.dart';
import '../../watch/screen/watch_screen.dart';

class BottomNavController extends GetxController {
  var selectedPage = 0.obs;
  final pageOptions = const [
    DashboardScreen(),
    WatchScreen(),
    MediaLibScreen(),
    MoreScreen(),
  ];
}