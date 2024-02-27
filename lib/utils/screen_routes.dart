import 'package:flutter/material.dart';
import 'package:imochat/screen/login/view/login_screen.dart';
import 'package:imochat/screen/login/view/sigh_in_screen.dart';
import 'package:imochat/screen/login/view/sigh_up_screen.dart';
import 'package:imochat/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder>screen_routes = {
  '/': (context) => const SplashScreen(),
  'login': (context) => const LoginScreen(),
  'signin': (context) => const SignInScreen(),
  'signup': (context) => const SignUpScreen(),
};
