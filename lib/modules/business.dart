import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/status.dart';

class BusniessScreen extends StatelessWidget {
  const BusniessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).busniess;
          return ConditionalBuilder(
              condition: list.length > 0,
              builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildArticleItem(list[index], context),
                  separatorBuilder: (context, index) =>
                      Container(width: double.infinity),
                  itemCount: 10),
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        });
  }
}
