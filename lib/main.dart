import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/decorations/app_theme.dart';
import 'package:real_estate_app/helpers/router.dart';
import 'package:real_estate_app/src/features/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(RealEstateApp());
}

class RealEstateApp extends StatefulWidget {
  const RealEstateApp({super.key});

  @override
  State<RealEstateApp> createState() => _RealEstateAppState();
}

class _RealEstateAppState extends State<RealEstateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppLightTheme().getTheme(context),
      darkTheme: AppDarkTheme().getTheme(context),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: AppRouter.scaffoldMessengerKey,
      navigatorKey: AppRouter.navigatorKey,
      home: Dashboard(),
    );
  }
}
