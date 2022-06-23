import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/status.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/news_layout.dart';
import 'componants.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              theme: ThemeData(
                  brightness: Brightness.light,
                  //    scaffoldBackgroundColor: Color(0xffffeed1),
                  appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(
                      color: Colors.black,
                      size: 30,
                    ),
                    backgroundColor: Color(0xFFce8b75),
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Colors.black),
                    centerTitle: true,
                    elevation: 5,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    //  selectedFontSize: 17,
                    type: BottomNavigationBarType.fixed,
                    //unselectedFontSize: 14,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.black,
                    //  backgroundColor: Color(0xFFce8b75),
                    elevation: 200,
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600))),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  //scaffoldBackgroundColor: Color(0xff242B2E),
                  appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(
                      color: Colors.white,
                      size: 30,
                    ),
                    //   backgroundColor: Colors.black87,
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Colors.white),
                    centerTitle: true,
                    elevation: 5,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    //  selectedFontSize: 17,
                    type: BottomNavigationBarType.fixed,
                    //unselectedFontSize: 14,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    //   backgroundColor: Colors.black87,
                    elevation: 200,
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w900))),
              debugShowCheckedModeBanner: false,
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: Directionality(
                  textDirection: TextDirection.rtl, child: NewsApp_Layout()));
        },
      ),
    );
  }
}
