import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/categorymodel.dart';
import 'package:news_app/modellist.dart';

class News {
  
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1c9978a331284f49a70841333deb6743";
    
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == "ok") {
      print("entered");
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          print('entered');
          ArticleModel articleModel = new ArticleModel(
            author: element["author"],
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urltoImage: element["urlToImage"],
            content: element['content'],
          );
          news.add(articleModel);
        }

        print(news.length);
      });
    }
  }
}
