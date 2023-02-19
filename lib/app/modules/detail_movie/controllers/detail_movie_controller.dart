// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/cast_model.dart';
import '../../../data/models/movie_details.dart';
import '../../../data/models/recomend.dart';
import '../../../data/services/constant.dart';
import '../../../data/services/services.dart';

class DetailMovieController extends GetxController {
  RcomendModel recomendList = RcomendModel();
  MovieDetailsModel movieDetails = MovieDetailsModel();
  CastModel castList = CastModel();

  upcomingMovieApiCall() async {
    final id = Get.arguments;
    var categoriesApi =
        "$commonUrl/movie/$id/recommendations?api_key=$apiKey&language=en-US&page=1";
    var finalData = await APIServices.getMethodWithHeaderDio(categoriesApi);
    recomendList = RcomendModel.fromJson(finalData);
    update();
  }

  movieDetais() async {
    final id = Get.arguments;
    print("---------$id");
    var categoriesApi =
        "$commonUrl/movie/$id?api_key=$apiKey&language=en-US";
    var finalData = await APIServices.getMethodWithHeaderDio(categoriesApi);
    movieDetails = MovieDetailsModel.fromJson(finalData);
    print('____${movieDetails.overview}');
    getCast();
    upcomingMovieApiCall();

    update();
  }

  getCast() async {
    final id = Get.arguments;
    print("---------$id");
    var categoriesApi =
        "$commonUrl/movie/$id/credits?api_key=$apiKey&language=en-US";
    var finalData = await APIServices.getMethodWithHeaderDio(categoriesApi);
    castList = CastModel.fromJson(finalData);
    print('____${movieDetails.overview}');
    update();
  }
}
