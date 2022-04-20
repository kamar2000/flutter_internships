

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_second/cupit/states.dart';

class AppMainCupit extends Cubit<AppMainStates> {
  AppMainCupit() : super(AppInitialState());

  static AppMainCupit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(AppChangeModeState());
  }
}