// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_second/layout/todo_app/cubit/states.dart';
import 'package:flutter_second/shared/components/applocal.dart';
import 'package:flutter_second/shared/components/constants.dart';

import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../main.dart';
import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';
import '../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'my_header_drawer.dart';

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
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {

          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return

            Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Center(
                child: Text(
                  cubit.titles[cubit.currentIndex],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: const Icon(Icons.brightness_4_rounded),
                )
              ],
            ),
            body:
                // cubit.newTasks.isEmpty
                //     ? const Center(child: CircularProgressIndicator())
                //     :
            cubit.screens[cubit.currentIndex],
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
                      // .then((value) {
                      // getDataFromDatabase(database).then((value) {
                      //      Navigator.pop(context);
                      //      setState(() {
                      //        isBottomSheetShown = false;
                      //        fabIcon = Icons.edit;
                      //        tasks = value;
                      //        timeController.text = '';
                      //        dateController.text = '';
                      //        titleController.text = '';
                      //      });
                      //    });
                      //  });
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                          (context) => Container(
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
                                          context: context,
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
              items:  [
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.menu,
                  ),
                  label:'${getLang(context, 'Tasks')}',
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.check_circle_outline,
                  ),
                  label:'${getLang(context, 'Done')}',
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.archive_outlined,
                  ),
                  label:'${getLang(context, 'Archive')}',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bar_chart_sharp,
                  ),
                  label: 'Charts',
                ),

              ],
            ),
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color:Theme.of(context).backgroundColor,
                      width: double.infinity,
                      height: 200.0,
                      child: Padding(
                        padding:  const EdgeInsets.only(top: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Container(

                              margin:const EdgeInsets.only(bottom: 10.0),
                              height: 70.0,
                              decoration:const BoxDecoration(
                                shape: BoxShape.circle,
                                image:DecorationImage(
                                  image: NetworkImage('https://variety.com/wp-content/uploads/2020/12/Adam_Driver.png'),
                                ),
                              ),
                            ),
                            const Text('Abdulrahman Kamar',style:TextStyle(color: Colors.white,fontSize: 20,) ,),
                            Text('mr.kamer2000@gmail.com',style:TextStyle(color: Colors.grey[200],fontSize: 14,) ,),


                          ],
                        ),
                      ),
                    ),
                    MyDrawerList(),
                  ],
                ),
              ),
            ),
          );


        },
      ),
    );
  }

  Widget MyDrawerList() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          menuItem(1,'Service',Icons.home_repair_service_outlined,),
          menuItem(2,'dashboard',Icons.dashboard_outlined,),
          menuItem(3,'settings',Icons.settings_outlined,),
          menuItem(4,'contacts',Icons.people_alt_outlined,),



        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon) {
    return Material(
      child: InkWell(
        onTap: (){
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children:  [
              Expanded(
                child: Icon(
                  icon,
                  size: 20.0,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// drawer: Drawer(
//   child: ListView(
//     padding: EdgeInsets.zero,
//     children: [
//       const UserAccountsDrawerHeader(
//         accountName: Text('Abdulrahman Kamar'),
//         accountEmail: Text('mr.kamer@gmail.com'),
//         currentAccountPicture: CircleAvatar(
//           backgroundImage: NetworkImage(
//             'https://variety.com/wp-content/uploads/2020/12/Adam_Driver.png?w=760',
//           ),
//         ),
//       ),
//       ListTile(
//         leading: const Icon(Icons.home),
//         title: const Text(
//           'Home',
//         ),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//       const Divider(
//         height: 1,
//         thickness: 1,
//       ),
//       ListTile(
//         leading: const Icon(Icons.menu),
//         title: const Text(
//           'Tasks',
//         ),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//       const Divider(
//         height: 1,
//         thickness: 1,
//       ),
//       ListTile(
//         leading: const Icon(Icons.settings),
//         title: const Text(
//           'Settings',
//         ),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//     ],
//   ),
// ),
