import 'package:api_example/model/article.dart';

class ArticleResponse {
  final List<Article> articles;
  final String error;

  ArticleResponse(this.articles, this.error);

  ArticleResponse.fromJson(Map<String, dynamic> json)
      : articles = (json['articles'] as List).map((i) =>
  new Article.fromJson(i)).toList(),
        error ="";

  ArticleResponse.withError(String errorValue)
    : articles = List(),
      error= errorValue;
}