import 'package:get/get.dart';
import 'package:mvoie_app_assignment/dashboard/screen/dashboard_screen.dart';
import 'package:mvoie_app_assignment/movie_detail/screen/movie_detail_screen.dart';
import 'package:mvoie_app_assignment/res/routes/route_name.dart';

import '../../BottomNavigation/screen/bottom_nav_screen.dart';
import '../../bindings/bottom_nav_binding.dart';
import '../../bindings/dashboard_binding.dart';
import '../../bindings/media_binding.dart';
import '../../bindings/more_binding.dart';
import '../../bindings/splash_binding.dart';
import '../../bindings/watch_binding.dart';
import '../../more/screen/more_screen.dart';
import '../../pay/screen/pay_screen.dart';
import '../../splash/screen/splash_screen.dart';
import '../../ticket/screen/ticket_screen.dart';
import '../../watch/screen/watch_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => const DashboardScreen(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: RouteName.movieDetailScreen,
      page: () => const MovieDetail(),
      binding: MediaBinding(),
    ),
    GetPage(
      name: RouteName.watchScreen,
      page: () => const WatchScreen(),
      binding: WatchBinding(),
    ),
    GetPage(
      name: RouteName.moreScreen,
      page: () => const MoreScreen(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: RouteName.bottomNavigationScreen,
      page: () => const BottomNavScreen(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: RouteName.ticketScreen,
      page: () => const TicketScreen(),
    ),
    GetPage(
      name: RouteName.payScreen,
      page: () => const PayScreen(),
    ),
  ];
}