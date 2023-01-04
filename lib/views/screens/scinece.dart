import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

import '../widgets/article_list.dart';

class Scinece extends StatelessWidget {
  final NewsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (_) => ArticleList(list: controller.science),
    );
  }
}
