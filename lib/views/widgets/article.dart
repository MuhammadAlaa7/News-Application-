import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

Widget articleItem(Map article) {
  final NewsController controller = Get.find();
  return (article['source']['name'] == "Aljazeera.net" ||
          article['url'] ==
              "https://www.aljazeera.com/news/2023/1/3/thousands-attend-funeral-of-kurds-killed-in-paris-in-december" ||
          article['source']['id'] == "al-jazeera-english")
      ? Container()
      : Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: controller.isDarkTheme
                    ? Color.fromARGB(255, 110, 57, 57)
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    // color: Colors.black12,
                    color: controller.isDarkTheme
                        ? Colors.white12
                        : Colors.black12,
                    blurRadius: 3.0,
                  )
                ],
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(28),

                        // image: NetworkImage(

                        //   // if image is null
                        //   article['urlToImage'] ??
                        //       'https://cdn-icons-png.flaticon.com/512/1042/1042363.png?w=740&t=st=1672698647~exp=1672699247~hmac=d68dd92cc1932a60026768782b8fc935166e626895d6a2ccee922407ac7c942b',

                        // ),
                        ),
                    child: CachedNetworkImage(
                      imageUrl: article['urlToImage'] ??
                          'https://cdn-icons-png.flaticon.com/512/1042/1042363.png?w=740&t=st=1672698647~exp=1672699247~hmac=d68dd92cc1932a60026768782b8fc935166e626895d6a2ccee922407ac7c942b',
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                    ),
                    child: Text(
                      article['source']['name'],
                      style: TextStyle(
                        fontSize: 15,
                        color: controller.isDarkTheme
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article['title'] ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          controller.isDarkTheme ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    // here 1. replacing the last 3 characters in the date
                    // 2. split at character T and
                    //  3. add the space between the data and time

                    article['publishedAt']
                            .replaceRange(16, null, '')
                            .split('T')
                            .join(' - At Time:  ') ??
                        '',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 13,
                      color:
                          controller.isDarkTheme ? Colors.white60 : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
}
