import 'package:flutter/material.dart';
import 'package:imochat/screen/dash/view/dash_screen.dart';
import 'package:imochat/screen/home/view/home_screen.dart';
import 'package:imochat/screen/login/view/login_screen.dart';
import 'package:imochat/screen/login/view/sigh_in_screen.dart';
import 'package:imochat/screen/login/view/sigh_up_screen.dart';
import 'package:imochat/screen/splash/view/splash_screen.dart';

import '../screen/profile/view/profile_screen.dart';

Map<String, WidgetBuilder>screen_routes = {
  '/': (context) => const SplashScreen(),
  'login': (context) => const LoginScreen(),
  'signin': (context) => const SignInScreen(),
  'signup': (context) => const SignUpScreen(),
  'dash': (context) => const DashScreen(),
  'home': (context) => const HomeScreen(),
  'profile': (context) => const ProfileScreen(),
};
