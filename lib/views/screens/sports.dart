import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../widgets/article.dart';

class Sports extends StatelessWidget {
  final NewsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    //TODO:   NOTE: >>>>>> if you want to update the logic here , you must use the controller.sports
    // TODO: as a list without passing it to a variable list an give it to the GetBuilder
    // TODO: The GetBuilder will not listen to the list until it is from the controller directly

    return GetBuilder<NewsController>(
      builder: (_) => ListView.builder(
        itemBuilder: (context, index) => articleItem(
          controller.sports[index],
        ),
        itemCount: controller.sports.length,
      ),
    );
  }
}
