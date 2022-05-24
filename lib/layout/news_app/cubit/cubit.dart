import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_second/layout/news_app/cupit/states.dart';

class NewsCupit extends Cubit<NewsStates>
{
  NewsCupit() : super(NewsInitialState());

  static NewsCupit get(context) =>BlocProvider.of(context);

  int currentIndex =0;

  void changeBottomNavBar(index){
    currentIndex==index;
    emit(NewsChangeIndexBottomNavBarState());
  }
}