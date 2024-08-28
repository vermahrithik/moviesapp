import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/controller/moviecontroller.dart';
// import 'package:moviesapp/model/moviemodel.dart';
import 'package:moviesapp/routing/app_route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataPage extends StatelessWidget {
  // final List<dynamic> data;
  final MovieController movieController = Get.find<MovieController>();
  DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E3DB),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'FILMFLIX',
          style: TextStyle(
              letterSpacing: 8,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0xffE50914)),
        ),
        actions: [
          IconButton.outlined(onPressed: (){
            FirebaseAuth.instance.signOut();
            SharedPreferences.getInstance().then((value) => value.setBool('isLoggedIn',false ),);
            context.goNamed(MyAppRouteConstants.loginRouteName);
          }, icon: Icon(Icons.logout))
        ],
        centerTitle: true,
        backgroundColor: const Color(0xffE9E3DB).withAlpha(1000),
        automaticallyImplyLeading: false,
        bottomOpacity: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => ListView.builder(
                itemCount: movieController.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = movieController.movies[index];
                  debugPrint('Obx is being rebuilt for index : ${index + 1}');
                  if (movieController.movies[index].movieName == "") {
                    return const Center(
                      child: Text(
                        'no data found',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            context.goNamed(MyAppRouteConstants.detailsRouteName,pathParameters: {'id':'${movie.movieId}'});
                            debugPrint('tapped on movie : ${movie.movieName}');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xffDFD3C4),
                            ),
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      onEnter: (event) => debugPrint('index : $index'),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500/${movie.moviePoster}',
                                          // 'https://image.tmdb.org/t/p/w500/${data[index]['poster_path']}',
                                          // height: 60,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Title : ',
                                                style: TextStyle(
                                                    fontFamily: 'roboto',
                                                    color: Color(0xff353132),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    letterSpacing: 2),
                                              ),
                                              WidgetSpan(
                                                alignment: PlaceholderAlignment
                                                    .baseline,
                                                baseline:
                                                    TextBaseline.alphabetic,
                                                child: Text(
                                                  '${movie.movieName}',
                                                  style: const TextStyle(
                                                    fontFamily: 'cinzel',
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff353132),
                                                    fontSize: 20,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Overview :',
                                                style: TextStyle(
                                                  fontFamily: 'roboto',
                                                  color: Color(0xff353132),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  letterSpacing: 2),
                                              ),
                                              WidgetSpan(
                                                alignment: PlaceholderAlignment.baseline,
                                                baseline: TextBaseline.alphabetic,
                                                child: Text(
                                                  '${movie.movieOverview}',
                                                  style: const TextStyle(
                                                    fontFamily: 'roboto',
                                                    letterSpacing: 2,
                                                    fontWeight:
                                                      FontWeight.w700,
                                                    color:
                                                      Color(0xff353132),
                                                    fontSize: 10),
                                                  overflow:
                                                    TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Release date : ',
                                                style: TextStyle(
                                                    fontFamily: 'roboto',
                                                    color: Color(0xff353132),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    letterSpacing: 2),
                                              ),
                                              WidgetSpan(
                                                alignment: PlaceholderAlignment
                                                    .baseline,
                                                baseline:
                                                    TextBaseline.alphabetic,
                                                child: Text(
                                                    '${movie.movieReleaseDate}',
                                                    style: const TextStyle(
                                                      fontFamily: 'digital',
                                                      letterSpacing: 2,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xff353132),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Popularity : ',
                                                style: TextStyle(
                                                    fontFamily: 'roboto',
                                                    color: Color(0xff353132),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    letterSpacing: 2),
                                              ),
                                              WidgetSpan(
                                                alignment: PlaceholderAlignment
                                                    .baseline,
                                                baseline:
                                                    TextBaseline.alphabetic,
                                                child: Text(
                                                    '${movie.moviePopularity}',
                                                    style: TextStyle(
                                                      fontFamily: 'digital',
                                                      letterSpacing: 2,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: double.parse(movie
                                                                  .moviePopularity
                                                                  .toString()) >
                                                              100
                                                          ? const Color(
                                                              0xff2B9C47)
                                                          : const Color(
                                                              0xffCF4037),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ));
                  }
                },
              ))),
    );
  }
}
