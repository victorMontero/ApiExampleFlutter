import 'package:api_example/model/source.dart';

class SourceResponse{
  final List<Source> sources;
  final String error;

  SourceResponse(this.sources, this.error);

  SourceResponse.fromJson(Map<String, dynamic> json)
      : sources = (json['articles'] as List).map((i) =>
  new Source.fromJson(i)).toList(),
        error ="";

  SourceResponse.withError(String errorValue)
      : sources = List(),
        error= errorValue;
}