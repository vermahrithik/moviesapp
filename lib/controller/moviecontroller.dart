// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/model/moviedetailmodel.dart';
import 'package:moviesapp/model/moviemodel.dart';

enum Status {success, loading, failed, networkError}

class MovieController extends GetxController {
  List<MovieModel> visibleData = <MovieModel>[].obs;
  var isLoading = false.obs;
  final pageSize = 5;
  var page = 1;


  final allMoviesPage = 1.obs;
  final areMoreMoviesAvailable = true.obs;
  final moviesStatus = Status.success.obs;
  final movies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  // void clearVariables (){
  //   allMoviesPage = 1;
  //
  // }

  Future<void> apiCall() async {
    // isLoading.value = true;

    allMoviesPage.value == 1 ? moviesStatus.value = Status.loading : moviesStatus.value = Status.success;

    if(areMoreMoviesAvailable.value){
      try {
        final dio = Dio();

        debugPrint("Api is calling with : Page : ${allMoviesPage.value}");

        final response = await dio.get(
          'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=7a3bd5d5f83da1324e1bfdf75f2a665c&page=$allMoviesPage',
        );
        debugPrint(response.statusCode.toString());

        if(response.statusCode == 200){
          moviesStatus.value = Status.success;

          areMoreMoviesAvailable.value = response.data['results'].length == 20;

          if(allMoviesPage.value == 1){
            movies.value = response.data['results'].map<MovieModel>((movie)=> MovieModel.fromJson(movie)).toList();
          }else{
            debugPrint("In page WITH CONDITION : ${allMoviesPage.value}");
            movies.addAll(response.data['results'].map<MovieModel>((movie)=> MovieModel.fromJson(movie)).toList());
          }

          // movies.addAll();
          // movies = response.data['results'];
          // movies.assignAll;
          allMoviesPage.value++;
          // debugPrint(movies.toString());
          // loadMoreData();
          update();
        }




      } catch (e) {
        debugPrint("Error in calling api :: $e");
        moviesStatus.value== Status.failed;
      }
    }else{
      debugPrint("Are more not available movies");
    }



    // debugPrint(movies.toString());
  }

  // void loadMoreData() {
  //   if ((page * pageSize) < movies.length) {
  //     var nextPageData = movies.sublist((page - 1) * pageSize, page * pageSize);
  //     visibleData.addAll(nextPageData);
  //     page++;
  //   } else {
  //     var remainingData = movies.sublist((page - 1) * pageSize);
  //     visibleData.addAll(remainingData);
  //   }
  // }

  String _x = "Hrithik";
  String get x => _x;

  set x(String name) {
    _x = name;
    update();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  //   // taskNameController.dispose();
  //   // taskDescriptionController.dispose();
  // }

  // editTask(int index, String taskName, String taskDesc) {
  //   // tasks[index] = TaskModel(taskName: taskName, taskDescription: taskDesc);
  //   // update();
  // }
}

class MovieDetailsController extends GetxController {
  MovieDetailModel movieDetails = MovieDetailModel();
  final String id;

  MovieDetailsController({required this.id});

  Future<void> apiDetailCall(String id) async {
    try {
      // final dio = Dio()..options = BaseOptions(baseUrl: '');
      final dio = Dio();
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id?api_key=7a3bd5d5f83da1324e1bfdf75f2a665c',
      );
      debugPrint("In movie detail page");
      debugPrint(response.statusCode.toString());

      if(response.statusCode == 200 || response.statusCode == 202){
        // if(response.data['body']){
        //
        // }
        debugPrint("Print Data : ${response.data}");

        MovieDetailModel data = MovieDetailModel.fromJson(response.data as Map<String,dynamic>);

        debugPrint("Converted to $data and one vaue : ${data.backdrop_path}" );

        movieDetails = data;
        update();


      }else{
        debugPrint("SMW");
      }

      // Assuming response.data is a Map containing the movie details
      // movieDetails = ;

      // debugPrint(movieDetails.toString());
    } catch (e) {
      debugPrint("Error in calling API :: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    apiDetailCall(id);
  }
}



// class MovieDetailsController extends GetxController {
//   List<dynamic> movieDetails = <dynamic>[].obs;
//   final String id;
//   MovieDetailsController({required this.id})
//   Future<void> apiDetailCall(String id) async {
//     try {
//       final dio = Dio();
//       final response = await dio.get(
//         'https://api.themoviedb.org/3/movie/$id?api_key=7a3bd5d5f83da1324e1bfdf75f2a665c',
//       );
//       debugPrint(response.data.toString());
//       // movies = response.data['results'];
//       // movieDetails.assignAll(response.data.map<MovieDetailModel>((movieDetails)=> MovieDetailModel.fromJson(movieDetails)).toList());
//       movieDetails.assign([MovieDetailModel.fromJson(response.data)]);
//       debugPrint(movieDetails.toString());
//     } catch (e) {
//       debugPrint("Error in calling api :: $e");
//     }
//     debugPrint(movieDetails.toString());
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     apiDetailCall(id);
//   }
//
// }
