// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_second/layout/news_app/cubit/states.dart';
import 'package:flutter_second/modules/business/business_screen.dart';
import 'package:flutter_second/modules/science/science_screen.dart';
import 'package:flutter_second/modules/settings/settings_screen.dart';
import 'package:flutter_second/modules/sports/sports_screen.dart';

import '../../../shared/network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) =>BlocProvider.of(context);

  int currentIndex =0;

  List <BottomNavigationBarItem> bottomItems=[
    const BottomNavigationBarItem(icon:Icon(Icons.business),label:'Business'),
    const BottomNavigationBarItem(icon:Icon(Icons.sports),label:'Sports'),
    const BottomNavigationBarItem(icon:Icon(Icons.science),label:'Science'),
  ];
  List <Widget> screens=[
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex=index;
    if(index ==1) {
      getSports();
    }
    if(index ==2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business=[];

  void getBusiness()
  {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apiKey':'c182e299dc094637a10672257af8e205',
      },
    ).then((value)
    {
      // print(value.data['articles'][0]['title']);
     business=value.data['articles'];
     print(business[0]['title']);
     emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));

    });

  }

  List<dynamic> sports=[];

  void getSports()
  {

    emit(NewsSportsLoadingState());
    if(sports.isEmpty){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apiKey':'c182e299dc094637a10672257af8e205',
        },
      ).then((value)
      {
        // print(value.data['articles'][0]['title']);
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));

      });
    }
    else{
      emit(NewsGetSportsSuccessState());

    }


  }

  List<dynamic> science=[];

  void getScience()
  {
    emit(NewsScienceLoadingState());
    if(science.isEmpty){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apiKey':'c182e299dc094637a10672257af8e205',
        },
      ).then((value)
      {
        // print(value.data['articles'][0]['title']);
        science=value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));

      });
    }
    else{
      emit(NewsGetScienceSuccessState());

    }

  }

}