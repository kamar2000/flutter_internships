import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_second/layout/todo_app/cubit/states.dart';

import 'package:intl/intl.dart';
import '../../shared/components/components.dart';
import 'cubit/cubit.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AppCubit()
        ..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Center(
                child: Text(
                  cubit.titles[cubit.currentIndex],
                ),
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            floatingActionButton: Visibility(
              visible: cubit.fab,
              child: FloatingActionButton(
                onPressed: () {
                  if (cubit.isBottomSheetShown) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertToDatabase(
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text,
                      );
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                          (context) =>
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    defaultFormField(
                                      controller: titleController,
                                      type: TextInputType.text,
                                      validate: (String value) {
                                        if (value.isEmpty) {
                                          return 'Title must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'Task Title',
                                      prefix: Icons.watch_later_outlined,
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    defaultFormField(
                                      controller: timeController,
                                      type: TextInputType.datetime,
                                      onTap: () {
                                        showTimePicker(
                                          context: context  ,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                      validate: (String value) {
                                        if (value.isEmpty) {
                                          return 'Time must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'Task Time',
                                      prefix: Icons.title,
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    defaultFormField(
                                      controller: dateController,
                                      type: TextInputType.datetime,
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                          DateTime.parse('2023-05-12'),
                                        ).then((value) {
                                          dateController.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      validate: (String value) {
                                        if (value.isEmpty) {
                                          return 'Date must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'Task Date',
                                      prefix: Icons.calendar_today,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      elevation: 20.0,
                    )
                        .closed
                        .then((value) {
                      cubit.changeBottomSheetState(
                        isShow: false,
                        icon: Icons.edit,
                      );
                      timeController.text = '';
                      dateController.text = '';
                      titleController.text = '';
                    });
                    cubit.changeBottomSheetState(
                      isShow: true,
                      icon: Icons.add,
                    );
                  }
                },
                child: Icon(
                  cubit.fabIcon,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.ChaneIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bar_chart_sharp,
                  ),
                  label: 'Charts',
                ),
              ],
            ),

          );
        },
      ),
    );
  }
}



