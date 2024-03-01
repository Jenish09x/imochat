import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imochat/screen/dash/controller/dash_controller.dart';
import 'package:imochat/screen/home/view/home_screen.dart';

import '../../call/view/call_screen.dart';
import '../../contact/view/contact_screen.dart';
import '../../setting/view/setting_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashController controller = Get.put(DashController());
  List screen = [
    const HomeScreen(),
    const CallScreen(),
    const ContactScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => screen[controller.stepIndex.value]),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            onDestinationSelected: (value) {
              controller.stepIndex.value = value;
            },
            selectedIndex: controller.stepIndex.value,
            destinations: const [
              NavigationDestination(icon: Icon(CupertinoIcons.home), label: "home"),
              NavigationDestination(icon: Icon(CupertinoIcons.phone), label: "home"),
              NavigationDestination(icon: Icon(CupertinoIcons.person), label: "home"),
              NavigationDestination(icon:  Icon(CupertinoIcons.settings), label: "home"),
            ],
          ),
        ),
      ),
    );
  }
}
