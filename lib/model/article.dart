import 'package:api_example/model/source.dart';

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String img;
  final String date;
  final String content;

  Article(
    this.author,
    this.title,
    this.description,
    this.url,
    this.img,
    this.date,
    this.content,
    this.source,
  );

  Article.fromJson(Map<String, dynamic> json)
      : source = Source.fromJson(json['source']),
        author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        img = json['urlToImage'],
        date = json['publishedAt'],
        content = json['content'];
}
