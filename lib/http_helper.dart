import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static Future getData({
    required String url,
  }) async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        Map body = json
            .decode(response.body); // the decode here convert the body to map
        return body;
        // print(body['articles'][0]['title']);
      } else {
        print('api error');
      }
    } catch (e) {
      print('there is an error $e');
    }

    // } else {
    //   throw Exception('error');
    // }
  }
}
