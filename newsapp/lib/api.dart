import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/Article.dart';

class ApiService {
  Future<List<Article>> article(String q) async {
    var url =
        'https://newsapi.org/v2/everything?q=$q&apiKey=1ea09f8ec36145108c43386474438897';

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      print(articles);    

      return articles;
    } else {
      throw ('Unable to fetch');
    }
  }
}
