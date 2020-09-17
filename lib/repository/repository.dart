import 'package:api_example/model/article_response.dart';
import 'package:api_example/model/source_response.dart';
import 'package:dio/dio.dart';

class NewsRepository{
  static String mainUrl = 'https://newsapi.org/v2/';
  final String apiKey = '16894722ee044069ac1ba24c6feddd08';

  final Dio _dio = Dio();

  var getSourceUrl = '$mainUrl/sources';
  var getTopHeadlinesUrl = '$mainUrl/top-headlines';
  var everythingUrl = '$mainUrl/everything';

  Future<SourceResponse> getSources() async{
    var params = {
      'apiKey': apiKey,
      'language': 'en',
      'country': 'ca'
    };
    try{
      Response response = await _dio.get(getSourceUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print('Exception occured: $error stackTrace: $stacktrace');
      return SourceResponse.withError(error);
    }
  }

  Future<ArticleResponse> getTopHeadlines() async {
    var params = {
      'apikey': apiKey,
      'country': 'ca'
    };
    try{
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getHotNews() async {
    var params = {
      'apikey': apiKey,
      'q': 'toronto',
      'sortBy': 'popularity'
    };

    try{
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId) async {
    var params = {
      'apikey': apiKey,
      'sources': sourceId
    };

    try{
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> search(String searchValue) async {
    var params = {
      'apikey': apiKey,
      'q': searchValue
    };

    try{
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      return ArticleResponse.withError(error);
    }
  }


}