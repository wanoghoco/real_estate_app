import 'package:flutter/material.dart';

String? currentRoute;

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static AppRouter? _instance;

  AppRouter._internal();

  factory AppRouter() {
    _instance ??= AppRouter._internal();
    return _instance!;
  }

  static replaceWith(Widget route, {isDialog = false, String? routeName}) {
    currentRoute = route.runtimeType.toString();

    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(
        fullscreenDialog: isDialog,
        builder: (context) => route,
      ),
    );
  }

  static pushWithName(Widget route, String routeName) {
    Navigator.push(
      navigatorKey.currentContext!,
      PageRouteBuilder(
        settings: RouteSettings(name: "/$routeName"),
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (_, __, ___) => route,
      ),
    );
  }

  static replaceWithName(Widget route, String routeName) {
    Navigator.pushReplacement(
      navigatorKey.currentContext!,
      PageRouteBuilder(
        settings: RouteSettings(name: "/$routeName"),
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (_, __, ___) => route,
      ),
    );
  }

  static popUntilName(BuildContext context, String name) {
    Navigator.popUntil(context, ModalRoute.withName('/$name'));
  }

  static navigateTo(Widget route, {isDialog = false}) async {
    currentRoute = route.runtimeType.toString();

    return await navigatorKey.currentState!.push(
      MaterialPageRoute(
        settings: RouteSettings(name: currentRoute),
        fullscreenDialog: isDialog,
        builder: (context) => route,
      ),
    );
  }

  static clearAllAndPush(Widget route, {isDialog = false, String? routeName}) {
    currentRoute = route.runtimeType.toString();

    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(
        fullscreenDialog: isDialog,
        builder: (context) => route,
      ),
      (Route<dynamic> r) => false,
    );
  }
}
