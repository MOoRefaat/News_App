import 'package:news_app/cubit/status.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/health.dart';
import 'package:news_app/modules/settings.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/modules/technology.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'package:sqflite/sqflite.dart';

import '../network/remote/dio_helper.dart';

class AppCubit extends Cubit<NewsAppStates> {
  AppCubit() : super(NewsIntialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety), label: 'Health'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.computer_outlined), label: 'Technology')
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [
    BusniessScreen(),
    HealthScreen(),
    SportsScreen(),
    TechnologyScreen(),
    // SettingsScreen(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> busniess = [];
  List<dynamic> health = [];
  List<dynamic> sports = [];
  List<dynamic> technology = [];

  void getBusniess() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'fbbcac299b9a4d9ea78141c0049ff9c5'
    }).then((value) {
      busniess = value.data['articles'];
      print(busniess[3]['title']);
      emit(NewsGetBusinessSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getHealth() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': 'fbbcac299b9a4d9ea78141c0049ff9c5'
    }).then((value) {
      health = value.data['articles'];
      emit(NewsGetHealthSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetHealthErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'fbbcac299b9a4d9ea78141c0049ff9c5'
    }).then((value) {
      sports = value.data['articles'];
      // print(busniess[3]['title']);
      emit(NewsGetSportsSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getTechnology() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': 'fbbcac299b9a4d9ea78141c0049ff9c5'
    }).then((value) {
      technology = value.data['articles'];
      // print(technology[3]['title']);
      emit(NewsGetTechnologySucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetTechnologyErrorState(error.toString()));
    });
  }

  bool isDark = true;
  void chnageMode() {
    isDark = !isDark;
    emit(NewsIntialState());
  }
}

class NewsCubit extends Cubit<NewsAppStates> {
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  bool isDark = true;
  void chnageMode() {
    isDark = !isDark;
    emit(NewsIntialState());
  }
}

//DioHelper.getData(url: 'v2/top-headlines', query: {
//   'country': 'eg',
//   'category': 'business',
//   'apiKey': 'fbbcac299b9a4d9ea78141c0049ff9c5'
//   }).then((value) {
//   print(value.data['articles'][2]['title']);
//   });
