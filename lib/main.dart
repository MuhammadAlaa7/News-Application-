import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/shared_pref.dart';
import 'views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // CacheHelper.loadData();
  Get.put(NewsController());
  final NewsController controller = Get.find();
  HttpOverrides.global = MyHttpoverrides();
  // get the state of isDark from the shared prefernces
  controller.isDarkTheme = await CacheHelper.loadData();

  runApp(MyApp());
  controller.getBusiness(apiKey: '569a461d793b418cb308cb2c33ba8946');
}

class MyApp extends StatelessWidget {
  final NewsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      // >>>> in order to make the themeMode listen to the change of the state
      builder: (c) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.deepOrange,
          ),
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[800],
          // ignore: prefer_const_constructors
          appBarTheme: AppBarTheme(
            actionsIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.grey[800],
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: Colors.grey[800],
            elevation: 0.0,
            titleTextStyle: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.deepOrange,
          ),
        ),
        themeMode: _controller.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        home: HomePage(),
      ),
    );
  }
}

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
