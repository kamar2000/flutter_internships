import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_second/layout/news_app/cubit/cubit.dart';
import 'package:flutter_second/layout/news_app/cubit/states.dart';

import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Search',
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormField(
                    controller: searchController,
                    label: 'Search',
                    type: TextInputType.text,
                    prefix: Icons.search,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: articleBuilder(list, context,isSearch: true),
                ),
              ],
            ),
          );
        });
  }
}
