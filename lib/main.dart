import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_second/layout/news_app/cubit/states.dart';
import 'package:flutter_second/layout/todo_app/cubit/states.dart';
import 'package:flutter_second/modules/counter/counter_screen.dart';
import 'package:flutter_second/modules/login/login_screen.dart';
import 'package:flutter_second/shared/bloc_observer.dart';
import 'package:flutter_second/shared/components/applocal.dart';
import 'package:flutter_second/shared/network/local/cache_helper.dart';
import 'package:flutter_second/shared/network/remote/dio_helper.dart';

import 'package:flutter_second/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/cubit/cubit.dart';
import 'layout/todo_app/todo_layout.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/driver_screen/driver_screen.dart';
import 'modules/messenger/messenger_screen.dart';
import 'package:flutter_second/shared/components/applocal.dart';

// SharedPreferences? mySharedPreferences;

void main() async {

  BlocOverrides.runZoned(
    () async{
      WidgetsFlutterBinding.ensureInitialized();
      // mySharedPreferences = await SharedPreferences.getInstance();
      DioHelper.init();
      await CacheHelper.init();
      bool isDark = false;
      if (CacheHelper.getBoolean(key: 'isDark') != null) {
        isDark = CacheHelper.getBoolean(key: 'isDark');
      } else {
        isDark = isDark;
      }  runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isDark}) : super(key: key);
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (context) => NewsCubit()
      ..getBusiness()

        ),
          BlocProvider(
            create: (context) => AppCubit() ..changeAppMode(
              fromShared: isDark,
            ),
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
                primaryColor: Colors.deepPurple,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurple,
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepPurple,
                primaryColor: Colors.deepPurple,
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: Colors.black,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurple,
                  unselectedItemColor: Colors.white,
                  elevation: 20.0,
                  backgroundColor: Colors.black,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: const Directionality(
                textDirection: TextDirection.ltr,
                child: NewsLayout(),
              ),
              // localizationsDelegates: const [
              //   AppLocale.delegate,
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              // ],
              // supportedLocales: const [Locale('en', ''), Locale('ar', '')],
              // localeResolutionCallback: (currentLang, supportLang) {
              //   if (currentLang != null) {
              //     for (Locale local in supportLang) {
              //       if (local.languageCode == currentLang.languageCode) {
              //         mySharedPreferences!
              //             .setString('lang', currentLang.languageCode);
              //         return currentLang;
              //       }
              //     }
              //   }
              //   return supportLang.first;
              // },
            );
          },
        ),
      );

  }
}
