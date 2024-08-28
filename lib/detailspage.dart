import 'package:flutter/material.dart';
import 'package:moviesapp/controller/moviecontroller.dart';
import 'package:get/get.dart';
import 'package:moviesapp/model/moviedetailmodel.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  late final MovieDetailsController movieDetailsController;
  DetailsPage({super.key,required this.id}){
    movieDetailsController = Get.put(MovieDetailsController(id: id));
  }

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controoler = Get.find<MovieDetailsController>();

  @override
  void initState() {
    super.initState();
    controoler.movieDetails= MovieDetailModel();
    debugPrint("Print id : ${widget.id}");
    controoler.apiDetailCall(widget.id);
  }

  // const DetailsPage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottomOpacity: 0,
      ),
      body: GetBuilder<MovieDetailsController>(builder: (controller) {
        return controller.movieDetails.backdrop_path != null ?
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500${controoler.movieDetails.backdrop_path}'),fit: BoxFit.cover)
          ),
          child: Center(
              child:
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black.withOpacity(0.7),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 20),
                      SizedBox(height: 250,child: ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network('https://image.tmdb.org/t/p/w500/${controoler.movieDetails.poster_path}',fit: BoxFit.cover,))),
                      // const SizedBox(width: 8,),
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
                                '${controoler.movieDetails.title}',
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
                        textAlign: TextAlign.center,
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
                                  '${controoler.movieDetails.overview}',
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
                              text: 'Revenue : ',
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
                                  '${controoler.movieDetails.revenue}',
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
                                  '${controoler.movieDetails.popularity}',
                                  style: TextStyle(
                                    fontFamily: 'digital',
                                    letterSpacing: 2,
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.w700,
                                    color: double.parse(controoler.movieDetails.popularity
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
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Adult :',
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
                                  '${controoler.movieDetails.adult}',
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
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Genres :',
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
                                  '${controoler.movieDetails.genres?.map((element)=>element['name'])}',
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
                    ]),
              ),
          ),
        ) : const Text(
          "NO PATh",
          style: TextStyle(
              color: Colors.black
          ),
        );
      },),
    );
  }
}
