import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/http_helper.dart';
import 'package:news_app/views/screens/business.dart';
import 'package:news_app/views/screens/sports.dart';
import 'package:news_app/views/widgets/app_bar.dart';

import 'scinece.dart';
import 'search.dart';

class HomePage extends StatelessWidget {
  final NewsController controller = Get.find();

  List<Widget> screens = [
    Business(),
    Scinece(),
    Sports(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (_) => Scaffold(
        // appBar: appBar('News App'),
        appBar: AppBar(
          title: const Text('News App'),
          titleSpacing: 12,
          actions: [
            IconButton(
              onPressed: () {
                controller.changeThemeMode();
              },
              icon: Icon(
                controller.isDarkTheme
                    ? Icons.wb_sunny_rounded
                    : Icons.nightlight_round_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: controller.items,
          currentIndex: controller.currentIndex,
          onTap: (index) {
            controller.changeBottomNav(index);
          },
        ),
      ),
    );
  }
}
