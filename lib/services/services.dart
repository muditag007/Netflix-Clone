// ignore_for_file: prefer_final_fields

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/models/titles.dart';
import 'package:netflix_clone/models/upcoming.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class ApiServices {
  Map<String, String> _headers = {
    "x-rapidapi-key": 'c24a7a07b5msh9e201872fa3bfc3p1e3a7djsnd8853141e445',
    "x-rapidapi-host": "moviesdatabase.p.rapidapi.com",
  };
  String endpoint =
      'https://moviesdatabase.p.rapidapi.com/titles/x/upcoming?page=2';

  Future<Upcoming> getInfo() async {
    final response = await http.get(Uri.parse(endpoint), headers: _headers);
    if (response.statusCode == 200) {
      return Upcoming.fromJson(json.decode(response.body));
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}

class ApiServices1{
  Map<String, String> _headers = {
    "x-rapidapi-key": 'c24a7a07b5msh9e201872fa3bfc3p1e3a7djsnd8853141e445',
    "x-rapidapi-host": "moviesdatabase.p.rapidapi.com",
  };
  String endpoint =
      'https://moviesdatabase.p.rapidapi.com/titles?page=2';

  Future<Titles> getInfo() async {
    final response = await http.get(Uri.parse(endpoint), headers: _headers);
    if (response.statusCode == 200) {
      return Titles.fromJson(json.decode(response.body));
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}




final upcomingProvider = Provider<ApiServices>((ref) => ApiServices());

final titlesProvider = Provider<ApiServices1>((ref) => ApiServices1());