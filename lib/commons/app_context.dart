import 'package:flutter/material.dart';

class AppContext {
  static AppContext? _navigationService;
  static AppContext get navigationService =>
      _navigationService ??= AppContext._init();
  AppContext._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
