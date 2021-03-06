// To parse this JSON data, do
//
//     final seacrhResponse = seacrhResponseFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/models.dart';

class SeacrhResponse {
  SeacrhResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory SeacrhResponse.fromJson(String str) =>
      SeacrhResponse.fromMap(json.decode(str));

  factory SeacrhResponse.fromMap(Map<String, dynamic> json) => SeacrhResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
