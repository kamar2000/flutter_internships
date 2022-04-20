import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCupit,AppStates>(
      listener: (context, state) {},
      builder: (context,state){

        var tasks = AppCupit.get(context).doneTasks;
        return  tasksBuilder(
          tasks: tasks,
        );
      },
    );
  }
}
