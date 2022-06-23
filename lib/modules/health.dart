import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants.dart';
import 'package:news_app/cubit/cubit.dart';

import '../cubit/status.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).health;
          return Scaffold(
              body: ConditionalBuilder(
                  condition: list.length > 0,
                  builder: (context) => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildArticleItem(
                          AppCubit.get(context).health[index], context),
                      separatorBuilder: (context, index) =>
                          Container(width: double.infinity),
                      itemCount: 10),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator())));
        });
  }
}
