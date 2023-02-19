import 'dart:developer';

import 'package:differenz_e_commerce_template/app/data/models/now_playing.dart';
import 'package:differenz_e_commerce_template/app/data/models/popular_model.dart';
import 'package:differenz_e_commerce_template/app/data/models/top_rated.dart';
import 'package:differenz_e_commerce_template/app/data/models/trending_models.dart';
import 'package:differenz_e_commerce_template/app/data/models/upcoming_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/constant.dart';
import '../../../data/services/services.dart';

class HomeController extends GetxController {
  TrendingModel trendingList = TrendingModel();
  PopularModel popularList = PopularModel();
  UpcomingModel upcomingList = UpcomingModel();
  TopRatedModel topratedList = TopRatedModel();
  NowPlayingModel nowPlaying = NowPlayingModel();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      trendingApiCall();
    });
  }

  trendingApiCall() async {
    var categoriesApi = "$commonUrl/trending/all/day?api_key=$apiKey";
    var finalData = await APIServices.getMethodWithHeaderDio(categoriesApi);

    trendingList = TrendingModel.fromJson(finalData);
    getPopularApiCall();
    upcomingMovieApiCall();
    getTopRatedApiCall();
    getPlayingTheateresApiCall();
    update();
  }

  getPopularApiCall() async {
    var categoriesApi =
        "$commonUrl/movie/popular?api_key=$apiKey&language=en-US&page=1";
    var finalData = await APIServices.getMethodWithHeaderDio(categoriesApi);

    popularList = PopularModel.fromJson(finalData);

    update();
  }

  getPlayingTheateresApiCall() async {
    var categoriesApi =
        "$commonUrl/now_playing?api_key=$apiKey&language=en-US&page=1";
    var finalData = await APIServices.getMethodWithHeaderDio(categoriesApi);

    nowPlaying = NowPlayingModel.fromJson(finalData);

    update();
  }

  getTopRatedApiCall() async {
    var categoriesApi =
        "$commonUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1";
    var finalData = await APIServices.getMethodWithHeaderDio(categoriesApi);

    topratedList = TopRatedModel.fromJson(finalData);
    print("========");
    print(topratedList.results!.length);

    update();
  }

  upcomingMovieApiCall() async {
    var categoriesApi =
        "$commonUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=1";
    var finalData = await APIServices.getMethodWithHeaderDio(categoriesApi);

    upcomingList = UpcomingModel.fromJson(finalData);

    log('categoriesList: $trendingList');
    update();
  }

  @override
  void onClose() {}
}
