import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

PreferredSizeWidget appBar(
  String title,
  /* you can pass various paramenters to appbar text customization such as fontsize and many more*/
) {
  final NewsController controller = Get.find();
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: controller.isDarkTheme ? Colors.white : Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            controller.changeThemeMode();
          },
          icon: const Icon(
            Icons.wb_sunny_rounded,
          ))
    ],
  );
}
