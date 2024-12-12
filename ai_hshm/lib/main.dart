import 'package:ai_hshm/apis/app_write.dart';
import 'package:ai_hshm/helper/pref.dart';
import 'package:ai_hshm/screen/feature/chatbot_feature.dart';
import 'package:ai_hshm/screen/feature/image_feature.dart';
import 'package:ai_hshm/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Pref.initialize();

  AppWrite.init();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: Pref.defaultTheme,
        darkTheme: ThemeData(
            useMaterial3: false,
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              elevation: 1,
              centerTitle: true,
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )),
        theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
              elevation: 1,
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.blue),
              titleTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
        home: SplashScreen());
  }
}

extension AppTheme on ThemeData {
  //light text color
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;

  //button color
  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}
