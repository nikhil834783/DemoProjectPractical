import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../controllers/detail_movie_controller.dart';

// ignore: must_be_immutable
class DetailMovieView extends GetView<DetailMovieController> {
  DetailMovieView({Key? key}) : super(key: key);
  final detailscontroller = DetailMovieController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.movieDetais();
    });
    return GetBuilder<DetailMovieController>(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Icon(
                Icons.star_border,
                color: Colors.blue,
                size: 22.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.favorite_outline,
                color: Colors.blue,
                size: 22.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Icon(
                  Icons.summarize,
                  color: Colors.blue,
                  size: 22.h,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: controller.movieDetails != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          controller.movieDetails.title != null
                              ? controller.movieDetails.title!
                              : '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                          child: FancyShimmerImage(
                            width: Get.width,
                            height: 200.h,
                            imageUrl: 
                                'https://image.tmdb.org/t/p/original/${controller.movieDetails.backdropPath}',
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          controller.movieDetails.overview!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Cast & Crew',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                     castShowing(),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: const Color(0xffF2F4F7),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Collection',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.r),
                                          ),
                                          child: FancyShimmerImage(
                                            imageUrl:
                                                'https://image.tmdb.org/t/p/original/${controller.movieDetails.backdropPath!}',
                                            height: 80.h,
                                            width: 100.w,
                                            boxFit: BoxFit.cover,
                                          )),
                                        
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.movieDetails.title!,
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              'Collection',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.movieDetails.title!,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Status',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                        'Original Language',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                       controller.movieDetails.status!,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                      controller.movieDetails.originalLanguage!,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Budget',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                        'Revenue',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        controller.movieDetails.budget!.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                       controller.movieDetails.revenue!.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'Videos',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  controller.recomendList != null &&
                                          controller.recomendList.results !=
                                              null
                                      ? CarouselSlider(
                                          options: CarouselOptions(
                                            aspectRatio: 2.0,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            enlargeCenterPage: true,
                                            height: 180.h,
                                            autoPlay: true,
                                          ),
                                          items: controller
                                              .recomendList.results!
                                              .map((ite) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Stack(
                                                  children: [
                                                    ite != null
                                                        ? Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r),
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://image.tmdb.org/t/p/w500/${ite.posterPath!}"),
                                                                fit: BoxFit
                                                                    .cover,
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
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Recommended",
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
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  controller.recomendList != null
                                      ? upcomingShowing()
                                      : SizedBox(),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ));
    });
  }

  upcomingShowing() {
    print("@@@@@@");
    print(controller.recomendList.results);
    return controller.recomendList.results != null
        ? GetBuilder<DetailMovieController>(builder: (context) {
            return SizedBox(
              height: 210.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.recomendList.results!.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
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
                                'https://image.tmdb.org/t/p/w500/${controller.recomendList.results![index].posterPath}',
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
                          controller.recomendList.results![index].title != null
                              ? controller.recomendList.results![index].title!
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
                          controller.recomendList.results![index].releaseDate !=
                                  null
                              ? controller
                                  .recomendList.results![index].releaseDate!
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
            );
          })
        : SizedBox();
  }

  castShowing() {
    print("@@@@@@");
    print(controller.recomendList.results);
    return controller.castList.cast != null
        ? GetBuilder<DetailMovieController>(builder: (context) {
            return SizedBox(
              height: 160.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.castList.cast!.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                      child: SizedBox(
                          width: 120.w,
                          // height: 180.h,
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
                                Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100.r),
                                      ),
                                      child: CircleAvatar(
                                        radius: 40.r,
                                        child: FancyShimmerImage(
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/original/${controller.castList.cast![index].profilePath}',
                                          boxFit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                 Center(
                                  child: Text(
                                   controller.castList.cast![index].name!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const Center(
                                  child: Text(
                                    'Spider man',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            );
          })
        : SizedBox();
  }
}
