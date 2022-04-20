import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_second/shared/cubit/cubit.dart';
import 'package:flutter_second/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit,AppStates>(
      listener: (context, state) {},
      builder: (context,state){

        var tasks = AppCupit.get(context).newTasks;
        return tasksBuilder(
          tasks: tasks,
        );
      },
      );
  }
}
