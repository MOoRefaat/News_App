import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/status.dart';
import 'package:dio/dio.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsApp_Layout extends StatelessWidget {
  const NewsApp_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getBusniess()
        ..getHealth()
        ..getSports()
        ..getTechnology(),
      child: BlocConsumer<AppCubit, NewsAppStates>(
        listener: (context, index) {},
        builder: (context, index) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            //  backgroundColor: Color(0xffffeed1),
            appBar: AppBar(
              title: Text(
                'أخبار اليوم',
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      // AppCubit.get(context).chnageMode();
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      NewsCubit.get(context).chnageMode();
                      // print('Eh yabbaaaaaaaaa');
                    },
                    icon: Icon(Icons.brightness_4_outlined)),
              ],
              //   backgroundColor: Colors.white,
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
