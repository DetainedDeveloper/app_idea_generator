import 'package:app_idea_generator/presentation/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_idea_generator/presentation/homescreen_screen/homescreen_screen.dart';
import 'package:app_idea_generator/presentation/dhiwise_screen/dhiwise_screen.dart';
import 'package:app_idea_generator/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String homescreenScreen = '/homescreen_screen';

  static const String dhiwiseScreen = '/dhiwise_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String settingsScreen = '/settings_screen';

  static Map<String, WidgetBuilder> get routes => {
        homescreenScreen: HomescreenScreen.builder,
        dhiwiseScreen: DhiwiseScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: DhiwiseScreen.builder,
        settingsScreen: (_) => const SettingsScreen()
      };
}
