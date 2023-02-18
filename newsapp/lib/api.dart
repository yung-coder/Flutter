import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/Article.dart';

class ApiService {
  static const url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=1ea09f8ec36145108c43386474438897';

  Future<List<Article>> article() async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ('Unable to fetch');
    }
  }
}
