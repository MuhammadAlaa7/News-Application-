import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/views/widgets/article.dart';

class ArticleList extends StatelessWidget {
  ArticleList({
    super.key,
    required this.list,
  });

  final NewsController controller = Get.find();
  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => articleItem(
        list[index],
      ),
      itemCount: list.length,
    );
  }
}
