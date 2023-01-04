import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../http_helper.dart';
import '../shared_pref.dart';

class NewsController extends GetxController {
  // bottom nav bar and its state
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      label: 'Business',
      icon: Icon(Icons.business),
    ),
    BottomNavigationBarItem(
        label: 'Science',
        icon: Icon(
          Icons.science,
        )),
    BottomNavigationBarItem(
        label: 'Sports',
        icon: Icon(
          Icons.sports,
        )),
  ];

  bool isDarkTheme = false;
  void changeThemeMode() {
    isDarkTheme = !isDarkTheme;
    CacheHelper.saveData(isDarkTheme);

    update();
    print('updated...');
  }

  int currentIndex = 0;
  void changeBottomNav(int index) {
    // if (index == 0) getBusiness();
    if (index == 1) {
      getScience(apiKey: '569a461d793b418cb308cb2c33ba8946');
    }
    if (index == 2) getSports(apiKey: '569a461d793b418cb308cb2c33ba8946');

    currentIndex = index;
    update();
  }

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];

  void getBusiness({required String apiKey}) {
    update();
    HttpHelper.getData(
      url:
          'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=${apiKey}',
    ).then((value) {
      business = value['articles'];
      // print(business[0]);
      // print(value['articles']['source']);
      update(); // you must use the update inside the then() or it will not listen to the logic
    });
  }

  // this method is different in the syntax but the same job
  void getScience({required String apiKey}) async {
    if (apiKey != null) {
      Map map = await HttpHelper.getData(
        url:
            'https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=${apiKey}',
      );
      science = map['articles'];
      update();
    } else {
      print('The apiKey is empty ');
    }
  }

  void getSports({required String apiKey}) {
    HttpHelper.getData(
      url:
          'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=${apiKey}',
    ).then((value) {
      //if(value['articles'][] == '')
      sports = value['articles'];
      // print(value['articles']['source']);
      // print(sports[0]['publishedAt']);
      update();
    });
    // the update must be in the then method not outside it
  }

  void getSearch({required String value, required String apiKey}) {
    search = [];
    // String valueFull = (value == '') ? 'egypt' : value;
    if (value == '') {
      search = [];
      update();
    } else {
      //
      HttpHelper.getData(
              url:
                  'https://newsapi.org/v2/everything?q=${value}&from=2022-12-04&sortBy=publishedAt&apiKey=${apiKey}')
          .then((value) {
        search = value['articles'];

        /// dispalySearch = search
        update(); // you must use the update inside the then() or it will not listen to the logic
      });
    }
    // search = [];
  }
}
