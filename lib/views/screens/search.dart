import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../widgets/article.dart';

class Search extends StatelessWidget {
  final NewsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          titleSpacing: 2,
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
          ],
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: controller.isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            TextFormField(
              onChanged: (value) => controller.getSearch(
                  value: value, apiKey: '569a461d793b418cb308cb2c33ba8946'),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) => articleItem(
                    controller.search[index],
                  ),
                  itemCount: controller.search.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
