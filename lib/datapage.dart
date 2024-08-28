import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/controller/moviecontroller.dart';
import 'package:moviesapp/routing/app_route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataPage extends StatefulWidget {

  DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final MovieController movieController = Get.find<MovieController>();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initialCall();

    _scrollController.addListener((){
      if(_scrollController.offset >= _scrollController.position.maxScrollExtent){
        movieController.apiCall();
      }
    });

  }

  // apiCall();

  void initialCall(){
    movieController.allMoviesPage.value = 1;
    movieController.areMoreMoviesAvailable.value = true;
    movieController.moviesStatus.value = Status.success;
    movieController.apiCall();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Colors.transparent]),
          ),
        ),
        title: const Text(
          'FILMFLIX',
          style: TextStyle(
              letterSpacing: 8,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0xffE50914)),
        ),
        actions: [
          SizedBox(
            height: 40,
            width: 40,
            child: IconButton.filled(onPressed: (){
              FirebaseAuth.instance.signOut();
              SharedPreferences.getInstance().then((value) => value.setBool('isLoggedIn',false ),);
              context.goNamed(MyAppRouteConstants.loginRouteName);
            }, padding: const EdgeInsets.all(0),focusColor: Colors.transparent,highlightColor: Colors.transparent,hoverColor: Colors.transparent,style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),backgroundColor: Colors.transparent),icon: const Icon(Icons.logout),color: Colors.white,),
          ),
          const SizedBox(width: 4,)
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottomOpacity: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if(movieController.moviesStatus.value == Status.loading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(movieController.movies.isEmpty || movieController.moviesStatus.value == Status.failed){
              return const Text("Something went wrong");
            }else if(movieController.moviesStatus.value == Status.networkError){
              return const Text("No interent connection error");
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: movieController.movies.length + (movieController.areMoreMoviesAvailable.value ? 1 : 0),
              itemBuilder: (BuildContext context, int index) {
                if(index == movieController.movies.length){
                  return const Center(child: CircularProgressIndicator(),);
                }
                // final movie = movieController.movies[index];
                debugPrint('Obx is being rebuilt for index : ${index + 1}');
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        context.goNamed(MyAppRouteConstants.detailsRouteName,pathParameters: {'id':'${movieController.movies[index].movieId}'});
                        // debugPrint('tapped on movie : ${movie.movieId}');
                        // debugPrint('tapped on movie : ${movie.movieName}');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade800.withOpacity(0.5),
                        ),
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${movieController.movies[index].moviePoster}',
                                    // 'https://image.tmdb.org/t/p/w500/${data[index]['poster_path']}',
                                    // height: 60,
                                    fit: BoxFit.fitHeight,
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
                                                color: Color(0xffE9E3DB),
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
                                              '${movieController.movies[index].movieName}',
                                              style: const TextStyle(
                                                fontFamily: 'cinzel',
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xffE9E3DB),
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
                                                color: Color(0xffE9E3DB),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                letterSpacing: 2),
                                          ),
                                          WidgetSpan(
                                              alignment: PlaceholderAlignment.baseline,
                                              baseline: TextBaseline.alphabetic,
                                              child: Text(
                                                '${movieController.movies[index].movieOverview}',
                                                style: const TextStyle(
                                                    fontFamily: 'roboto',
                                                    letterSpacing: 2,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    color:
                                                    Color(0xffE9E3DB),
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
                                                color: Color(0xffE9E3DB),
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
                                                '${movieController.movies[index].movieReleaseDate}',
                                                style: const TextStyle(
                                                  fontFamily: 'digital',
                                                  letterSpacing: 2,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Color(0xffE9E3DB),
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
                                                color: Color(0xffE9E3DB),
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
                                                '${movieController.movies[index].moviePopularity}',
                                                style: TextStyle(
                                                  fontFamily: 'digital',
                                                  letterSpacing: 2,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: double.parse(movieController.movies[index]
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
              },
            );
          })),
    );
  }

}
