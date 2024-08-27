// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/model/moviedetailmodel.dart';
import 'package:moviesapp/model/moviemodel.dart';

class MovieController extends GetxController {
  List<MovieModel> movies = <MovieModel>[].obs;

  Future<void> apiCall() async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=7a3bd5d5f83da1324e1bfdf75f2a665c',
      );
      debugPrint(response.data.toString());
      // movies = response.data['results'];
      movies.assignAll(response.data['results'].map<MovieModel>((movie)=> MovieModel.fromJson(movie)).toList());
      debugPrint(movies.toString());
    } catch (e) {
      debugPrint("Error in calling api :: $e");
    }
    debugPrint(movies.toString());
  }

  String _x = "Hrithik";
  String get x => _x;

  set x(String name) {
    _x = name;
    update();
  }
  @override
  void onInit() {
    super.onInit();
    apiCall();
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
