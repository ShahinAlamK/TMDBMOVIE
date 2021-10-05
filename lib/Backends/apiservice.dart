import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meeco/Model/MovieModel.dart';
import 'package:meeco/Model/personModel.dart';

class ApiService extends ChangeNotifier{

   static String mainUrl = "https://api.themoviedb.org/3";
   String apiKey = "48b2ebd80575bc8acd6172ce4e10e9de";
   Dio _dio=Dio();

   var getTopRate="$mainUrl/movie/top_rated";
   var getPlaying="$mainUrl/movie/now_playing";
   var getPopular="$mainUrl/movie/popular";
   var getDiscover="$mainUrl/discover/movie";
   var getUpcoming="$mainUrl/movie/upcoming";
   var getPeople="$mainUrl/person/popular";


  Future <MovieModel?>getTopRateMovie() async {
    var params={
      "api_key":apiKey,
      "language":"en-us",
      "page":1,
    };
    try{
      final response=await _dio.get(getTopRate,queryParameters: params);
      if(response.statusCode==200){
      // final decode=json.decode(response.data);
        return MovieModel.fromJson(response.data);
      }
    }catch(e){
      print(e.toString());
    }
  }

   Future <MovieModel?>getPlayingMovie() async {
     var params={
       "api_key":apiKey,
       "language":"en-us",
       "page":1,
     };
     try{
       final response=await _dio.get(getPlaying,queryParameters: params);
       if(response.statusCode==200){
         // final decode=json.decode(response.data);
         return MovieModel.fromJson(response.data);
       }
     }catch(e){
       print(e.toString());
     }
   }

   Future <MovieModel?>getPopularMovie() async {
     var params={
       "api_key":apiKey,
       "language":"en-us",
       "page":1,
     };
     try{
       final response=await _dio.get(getPopular,queryParameters: params);
       if(response.statusCode==200){
         // final decode=json.decode(response.data);
         return MovieModel.fromJson(response.data);
       }
     }catch(e){
       print(e.toString());
     }
   }

   Future <MovieModel?>getDiscoverMovie() async {
     var params={
       "api_key":apiKey,
       "language":"en-us",
       "page":2,
     };
     try{
       final response=await _dio.get(getDiscover,queryParameters: params);
       if(response.statusCode==200){
         // final decode=json.decode(response.data);
         return MovieModel.fromJson(response.data);
       }
     }catch(e){
       print(e.toString());
     }
   }

   Future <MovieModel?>getUpcomingMovie() async {
     var params={
       "api_key":apiKey,
       "language":"en-us",
       "page":1,
     };
     try{
       final response=await _dio.get(getUpcoming,queryParameters: params);
       if(response.statusCode==200){
         return MovieModel.fromJson(response.data);
       }
       notifyListeners();
     }catch(e){
       print(e.toString());
     }
   }

   Future <PersonModel?>getPerson() async {
     var params={
       "api_key":apiKey,
       "language":"us",
       "page":1,
     };
     try{
       final response=await _dio.get(getUpcoming,queryParameters: params);
       if(response.statusCode==200){
          print(response.data);
         return PersonModel.fromJson(response.data);
       }
       notifyListeners();
     }catch(e){
       print(e.toString());
     }
   }

}
