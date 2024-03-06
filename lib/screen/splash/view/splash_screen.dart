import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/fire_helper/fire_auth_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isLogin = FireAuthHelper.fireAuthHelper.checkUser();
    Future.delayed(const Duration(seconds: 3),
      () => Get.offAllNamed(isLogin==false ? "login" : "profile"),
    );
    FireAuthHelper.fireAuthHelper.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/image/logo.json", height: 180),
              Animate(
                effects: const [FadeEffect(duration: Duration(seconds: 3))],
                child: const Text(
                  "ImoChat",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
