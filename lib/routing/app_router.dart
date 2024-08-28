import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/datapage.dart';
import 'package:moviesapp/detailspage.dart';
import 'package:moviesapp/errorpage.dart';
import 'package:moviesapp/homepage.dart';
import 'package:moviesapp/loginpage.dart';
import 'package:moviesapp/mainpage.dart';
import 'package:moviesapp/routing/app_route_constants.dart';
import 'package:moviesapp/signuppage.dart';
import 'package:moviesapp/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppRouter{
  static final GoRouter router = GoRouter(
      initialLocation: '/',
      redirect: (context, state) async {
        debugPrint("Path  :${state.uri}");
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        if(sharedPreferences.getBool('isLoggedIn')==true){
          if(state.uri.toString().contains('/login')){
            return '/datapage';
          }
        }else{
          return '/login';
        }
        return null;
      },
      debugLogDiagnostics: true,
      errorPageBuilder: (context,state){
        return const MaterialPage(child: ErrorPage());
      },
      routes: [
        // Splash Screen Route :
        GoRoute(
          name: MyAppRouteConstants.splashScreenRouteName,
          path: '/',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : SplashScreen');
            return const MaterialPage(child: SplashScreen()); },
        ),
        // Login Page Route :
        GoRoute(
          name: MyAppRouteConstants.loginRouteName,
          path: '/login',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : LoginPage');
            return const MaterialPage(child: LoginPage()); },
        ),
        // SignUp Page Route :
        GoRoute(
          name: MyAppRouteConstants.signUpRouteName,
          path: '/signup',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : SignUpPage');
            return const MaterialPage(child: SignUpPage()); },
        ),
        // Home Page Route :
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
          path: '/home',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : HomePage');
            return const MaterialPage(child: HomePage()); },
        ),
        // Data Page Route :
        GoRoute(
          name: MyAppRouteConstants.dataRouteName,
          path: '/datapage',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : DataPage');
            // final String dataString = state.pathParameters['data'] ?? '[]';
            // final List<dynamic> data = jsonDecode(dataString);
            return MaterialPage(child: DataPage());
          },
        ),
        // Main Page Route :
        GoRoute(
          name: MyAppRouteConstants.mainRouteName,
          path: '/mainpage',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : MainPage');
            // final String dataString = state.pathParameters['data'] ?? '[]';
            // final List<dynamic> data = jsonDecode(dataString);
            return const MaterialPage(child: MainPage());
          },
        ),
        GoRoute(
          path: '/details/:id',
          name: MyAppRouteConstants.detailsRouteName,
          pageBuilder: (context,state){
            debugPrint('config page : DetailsPage');
            final String idString = state.pathParameters['id'] ?? '[]';
            return MaterialPage(child: DetailsPage(id: idString));
          },
        ),
      ],
  );

  GoRouter getRouter(BuildContext context){
    return GoRouter(
      initialLocation: '/',
      redirect: (context, state) async {
        debugPrint("Path In here  :${state.path}");

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        if(sharedPreferences.getBool('isLoggedIn')==true){
          debugPrint("Path  :${state.path}");
        }else{
          return null;
        }
        return null;
      },
      debugLogDiagnostics: true,
      errorPageBuilder: (context,state){
        return const MaterialPage(child: ErrorPage());
      },
      routes: [
        // Splash Screen Route :
        GoRoute(
          name: MyAppRouteConstants.splashScreenRouteName,
          path: '/',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : SplashScreen');
            return const MaterialPage(child: SplashScreen()); },
        ),
        // Login Page Route :
        GoRoute(
          name: MyAppRouteConstants.loginRouteName,
          path: '/login',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : LoginPage');
            return const MaterialPage(child: LoginPage()); },
        ),
        // SignUp Page Route :
        GoRoute(
          name: MyAppRouteConstants.signUpRouteName,
          path: '/signup',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : SignUpPage');
            return const MaterialPage(child: SignUpPage()); },
        ),
        // Home Page Route :
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
          path: '/home',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : HomePage');
            return const MaterialPage(child: HomePage()); },
        ),
        // Data Page Route :
        GoRoute(
          name: MyAppRouteConstants.dataRouteName,
          path: '/datapage',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : DataPage');
            // final String dataString = state.pathParameters['data'] ?? '[]';
            // final List<dynamic> data = jsonDecode(dataString);
            return MaterialPage(child: DataPage());
          },
        ),
        // Main Page Route :
        GoRoute(
          name: MyAppRouteConstants.mainRouteName,
          path: '/mainpage',
          // builder: (context,state){ return Home();},
          pageBuilder: (context,state){
            debugPrint('config page : MainPage');
            // final String dataString = state.pathParameters['data'] ?? '[]';
            // final List<dynamic> data = jsonDecode(dataString);
            return const MaterialPage(child: MainPage());
          },
        ),
        GoRoute(
          path: '/details/:id',
          name: MyAppRouteConstants.detailsRouteName,
          pageBuilder: (context,state){
            debugPrint('config page : DetailsPage');
            final String idString = state.pathParameters['id'] ?? '[]';
            return MaterialPage(child: DetailsPage(id: idString));
          },
        ),
      ],
      // errorPageBuilder: (context,state){
      //   return const MaterialPage(child: ErrorPage());
      // },
    );
  }
}