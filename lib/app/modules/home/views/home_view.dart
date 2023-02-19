import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/const_color.dart';
import '../../../../main.dart';
import '../../detail_movie/controllers/detail_movie_controller.dart';
import '../../detail_movie/views/detail_movie_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  final detailController = Get.put(DetailMovieController());
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: darkMode.value ? Colors.black : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "What's Popular",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                          size: 18.h,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              controller.popularList != null ? popularShowing() : SizedBox(),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Playing in theaters",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                          size: 18.h,
                        )
                      ],
                    )
                  ],
                ),
              ),
              controller.nowPlaying != null &&
                      controller.nowPlaying.results != null
                  ? CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        height: 180.h,
                        autoPlay: true,
                      ),
                      items: controller.nowPlaying.results!.map((ite) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                ite.posterPath != null
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.to(DetailMovieView(),
                                              arguments: ite.id);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w500/${ite.posterPath!}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    )
                  : SizedBox(),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trending",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                          size: 18.h,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              controller.trendingList != null ? nowShowing() : SizedBox(),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Top Rated",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                          size: 18.h,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              controller.topratedList != null ? topRated() : SizedBox(),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upcoming",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                          size: 18.h,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              controller.upcomingList != null ? upcomingShowing() : SizedBox()
            ],
          ),
        ),
      );
    });
  }

  nowShowing() {
    return controller.trendingList.results != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 210.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.trendingList.results!.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(DetailMovieView(),
                            arguments:
                                controller.trendingList.results![index].id);
                        // Get.toNamed(
                        //   Routes.DETAIL_MOVIE,
                        //   // Get Id Movie
                        //   arguments: controller.trendingMoviews[index].id,
                        // );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FancyShimmerImage(
                            width: 100.w,
                            height: 140.h,
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500/${controller.trendingList.results![index].posterPath}',
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.trendingList.results![index].title != null
                              ? controller.trendingList.results![index].title!
                              : '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.trendingList.results![index].releaseDate !=
                                  null
                              ? controller
                                  .trendingList.results![index].releaseDate!
                              : '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }

  popularShowing() {
    return controller.popularList.results != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 210.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularList.results!.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        print(
                            '=======${controller.popularList.results![index].id}');
                        Get.to(DetailMovieView(),
                            arguments:
                                controller.popularList.results![index].id);

                        // Get.toNamed(Routes.DETAIL_MOVIE,

                        //         // Get Id Movie
                        //         arguments: controller.nowPlayingMovies[index].id);
                        // Get.toNamed(
                        //   Routes.DETAIL_MOVIE,
                        //   // Get Id Movie
                        //   arguments: controller.trendingMoviews[index].id,
                        // );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FancyShimmerImage(
                            width: 100.w,
                            height: 140.h,
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500/${controller.popularList.results![index].posterPath}',
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.popularList.results![index].title != null
                              ? controller.popularList.results![index].title!
                              : '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.popularList.results![index].releaseDate !=
                                  null
                              ? controller
                                  .popularList.results![index].releaseDate!
                              : '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }

  upcomingShowing() {
    return controller.upcomingList.results != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 210.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.upcomingList.results!.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(DetailMovieView(),
                            arguments:
                                controller.upcomingList.results![index].id);
                        // Get.toNamed(
                        //   Routes.DETAIL_MOVIE,
                        //   // Get Id Movie
                        //   arguments: controller.trendingMoviews[index].id,
                        // );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FancyShimmerImage(
                            width: 100.w,
                            height: 140.h,
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500/${controller.upcomingList.results![index].posterPath}',
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.upcomingList.results![index].title != null
                              ? controller.upcomingList.results![index].title!
                              : '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.upcomingList.results![index].releaseDate !=
                                  null
                              ? controller
                                  .upcomingList.results![index].releaseDate!
                              : '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }

  topRated() {
    return controller.topratedList.results != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 200.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.topratedList.results!.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(DetailMovieView(),
                            arguments:
                                controller.topratedList.results![index].id);
                        // Get.toNamed(
                        //   Routes.DETAIL_MOVIE,
                        //   // Get Id Movie
                        //   arguments: controller.trendingMoviews[index].id,
                        // );
                      },
                      child: Card(
                        color: const Color(0xffF2F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              // BorderRadius.only(topLeft:Radius.circular(10.r),topRight: Radius.circular(10.r) ),
                              BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r)),
                              child: FancyShimmerImage(
                                width: 200.w,
                                height: 120.h,
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w500/${controller.topratedList.results![index].posterPath}',
                                boxFit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              width: 200.w,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  controller.topratedList.results![index]
                                              .title !=
                                          null
                                      ? controller
                                          .topratedList.results![index].title!
                                      : '',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }
}

class ShimmerShow extends StatelessWidget {
  const ShimmerShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: ((_, __) {
            return Container(
              margin: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(width: 1.w, color: ConstColor.gray200),
                color: Colors.white,
              ),
              height: 170.h,
              width: 160.w,
            );
          }),
        ),
      ),
    );
  }
}
