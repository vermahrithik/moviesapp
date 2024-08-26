import 'package:flutter/material.dart';
import 'package:moviesapp/controller/moviecontroller.dart';
import 'package:get/get.dart';
import 'package:moviesapp/model/moviedetailmodel.dart';
class DetailsPage extends StatelessWidget {
  // Get.put(MovieDetailsController());
  final String id;
  // final MovieDetailsController movieDetailsController = Get.put(MovieDetailsController(id: id));
  late final MovieDetailsController movieDetailsController;
  DetailsPage({super.key,required this.id}){
    movieDetailsController = Get.put(MovieDetailsController(id: id));
  }
  // const DetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    movieDetailsController.apiDetailCall(id);
    final String movieDets = '${movieDetailsController.movieDetails[0].id}';
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
        centerTitle: true,
        backgroundColor: const Color(0xffE9E3DB).withAlpha(1000),
        automaticallyImplyLeading: false,
        bottomOpacity: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Obx(() {
          if(movieDets.isBlank!){
            return Center(child: Text('no details found',style: TextStyle(color: Colors.grey,fontSize: 28,fontFamily: 'roboto'),));
          }else{
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xffDFD3C4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 50,width: 50,child: ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network('https://image.tmdb.org/t/p/w500/${movieDets}',fit: BoxFit.cover,)))
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
