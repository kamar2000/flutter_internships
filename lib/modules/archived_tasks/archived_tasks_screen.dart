import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/todo_app/cubit/cubit.dart';
import '../../layout/todo_app/cubit/states.dart';
import '../../shared/components/components.dart';


class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit,AppStates>(
      listener: (context, state) {

      },
      builder: (context,state){

        var tasks = AppCupit.get(context).archivedTasks;
        return ConditionalBuilder(condition:state is! AppGetDatabaseLoadingState ,builder: (context) =>  tasksBuilder(
          tasks: tasks,
        ), fallback:(context) => const Center(child: CircularProgressIndicator(),) );


      },
    );
  }
}
