import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/views/widgets/article_list.dart';

class Business extends StatelessWidget {
  final NewsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (_) => ArticleList(list: controller.business),
    );
  }
}
