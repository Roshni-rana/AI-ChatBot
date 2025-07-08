import 'package:AIChatBot/feature/auth/view/create_account_page.dart';
import 'package:AIChatBot/feature/bottom_nav_bar/view/bottom_nav_bar_page.dart';
import 'package:AIChatBot/feature/home/view/home_page.dart';
import 'package:AIChatBot/feature/splash/view/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/splash/view/pages/splash.dart' show SplashScreen;

enum AppRoutes { splash, intro, createAccountPage, homePage, bottomNavBarPage }

extension AppRoutesExtension on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.splash:
        return '/';
      // case AppRoutes.createAccount:
      //   return "${AppRoutes.signUp.route}/${AppRoutes.createAccount.subRoute}";
      // case AppRoutes.twoAuthVerify:
      //   return "${AppRoutes.signUp.route}/${AppRoutes.twoAuthVerify.subRoute}";
      default:
        return '/$value';
    }
  }

  String get subRoute {
    switch (this) {
      default:
        return value;
    }
  }

  String get name {
    switch (this) {
      default:
        return value;
    }
  }

  String get value {
    return toString().split('.').last;
  }

  Widget get widget {
    switch (this) {
      case AppRoutes.splash:
        return const SplashScreen();
      case AppRoutes.intro:
        return const IntroPage();
      case AppRoutes.createAccountPage:
        return const CreateAccountPage();
      case AppRoutes.bottomNavBarPage:
        return const BottomNavBarPage();
      case AppRoutes.homePage:
        return const HomePage();
      default:
        return const SizedBox();
    }
  }
}

extension GoRouteExtension on GoRoute {
  AppRoutes? get getAppRoute =>
      AppRoutes.values.firstWhere((element) => element.name == name);
}
