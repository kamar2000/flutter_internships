import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_second/layout/home_layout.dart';
import 'package:flutter_second/modules/counter/counter_screen.dart';
import 'package:flutter_second/modules/login/login_screen.dart';
import 'package:flutter_second/shared/bloc_observer.dart';
import 'package:flutter_second/shared/cubit/cubit.dart';
import 'package:flutter_second/shared/cubit/states.dart';
import 'package:flutter_second/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'cupit/cupit.dart';
import 'cupit/states.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/driver_screen/driver_screen.dart';
import 'modules/messenger/messenger_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppMainCupit(),
      child: BlocConsumer<AppMainCupit, AppMainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),

              ),
              backgroundColor: Colors.blue,
              iconTheme: IconThemeData(
                color: defColor1,
              ),
              listTileTheme: const ListTileThemeData(textColor: Colors.black,
              iconColor: Colors.grey),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),

              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              appBarTheme:  AppBarTheme(
                backgroundColor: HexColor('333739'),
              ),
              backgroundColor:Colors.deepOrange,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              listTileTheme: const ListTileThemeData(textColor: Colors.black,
                  iconColor: Colors.grey,

              ),

            ),
            themeMode: AppMainCupit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
