import 'package:get/get.dart';
import '../app/modules/detail_movie/bindings/detail_movie_binding.dart';
import '../app/modules/detail_movie/views/detail_movie_view.dart';
import '../app/modules/home/bindings/home_binding.dart';
import '../app/modules/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;
  static final routes = [
  
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),


 GetPage(
      name: _Paths.detailMovie,
      page: () => DetailMovieView(),
      binding: DetailMovieBinding(),
    ),
  ];
}
