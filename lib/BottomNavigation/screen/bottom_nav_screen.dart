import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../controller/bottom_nav_controller.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var bottomNavController = Get.find<BottomNavController>();

  /*int selectedPage = 0;
  final _pageOptions = const [
    DashboardScreen(),
    WatchScreen(),
    MediaLibScreen(),
    MoreScreen(),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: SnakeShape.indicator,
          snakeViewColor: Constants.COLOR3,
          selectedItemColor: Colors.white,
          unselectedItemColor: Constants.COLOR3,
          showUnselectedLabels: true,
          backgroundColor: Constants.COLOR1,
          showSelectedLabels: true,
          currentIndex: bottomNavController.selectedPage.value,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          onTap: (int i) {
            bottomNavController.selectedPage.value = i;
            /*setState(() {
              selectedPage = i;
            });*/
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard,), label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle), label: 'Watch'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), label: 'Media Library'),
            BottomNavigationBarItem(icon: Icon(Icons.list,), label: 'More'),
          ],
        ),
        body: bottomNavController.pageOptions[bottomNavController.selectedPage.value],
      );
    });
  }
}