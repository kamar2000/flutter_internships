import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/todo_app/cubit/cubit.dart';
import '../../layout/todo_app/cubit/states.dart';
import '../../models/bar_chart/bar_chart_model.dart';
import '../../shared/components/components.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsTaskScreen extends StatelessWidget {


  ChartsTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  int  x1=0;int x2=0;int x3=0;int x4=0;int x5=0;int x6=0;int x7=0;int x8=0;int x9=0;int x10=0;int x11=0;int x12=0;
    AppCubit.get(context).doneTasks.forEach((element) {
      if (element['date'].toString().substring(0, 3) == 'Jan') {
        x1 ++;
      } else if (element['date'].toString().substring(0, 3) == 'Feb') {
        x2 ++;
      } else if (element['date'].toString().substring(0, 3) == 'Mar') {
        x3 ++;
      } else if (element['date'].toString().substring(0, 3) == 'Apr') {
        x4 ++;
      } else if (element['date'].toString().substring(0, 3) == 'May') {
        x5 ++;
      } else if (element['date'].toString().substring(0, 3) == 'Jun') {
        x6 ++;
      } else if (element['date'].toString().substring(0, 3) == 'Jul') {
        x7 ++;
      } else if (element['date'].toString().substring(0, 3) == 'Aug') {
        x8 ++;
      }else if (element['date'].toString().substring(0, 3) == 'Sep') {
        x9 ++;
      }else if (element['date'].toString().substring(0, 3) == 'Oct') {
        x10 ++;
      }else if (element['date'].toString().substring(0, 3) == 'Nov') {
        x11 ++;
      }else if (element['date'].toString().substring(0, 3) == 'Dec') {
        x12 ++;
      }

    });
    final List<BarChartModel> data = [
      BarChartModel(
        date: "jan",
        financial: x1,
        color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
      ),
      BarChartModel(
        date: "feb",
        financial: x2,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        date: "mar",
        financial: x3,
        color: charts.ColorUtil.fromDartColor(Colors.green),
      ),
      BarChartModel(
        date: "apr",
        financial: x4,
        color: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
      BarChartModel(
        date: "may",
        financial: x5,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
      ),
      BarChartModel(
        date: "jun",
        financial: x6,
        color: charts.ColorUtil.fromDartColor(Colors.pink),
      ),
      BarChartModel(
        date: "jul",
        financial: x7,
        color: charts.ColorUtil.fromDartColor(Colors.purple),
      ),
      BarChartModel(
        date: "aug",
        financial: x8,
        color: charts.ColorUtil.fromDartColor(Colors.indigo),
      ),
      BarChartModel(
        date: "sep",
        financial: x9,
        color: charts.ColorUtil.fromDartColor(Colors.cyan),
      ),
      BarChartModel(
        date: "oct",
        financial: x10,
        color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
      ),
      BarChartModel(
        date: "nov",
        financial: x11,
        color: charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent),
      ),
      BarChartModel(
        date: "dec",
        financial: x12,
        color: charts.ColorUtil.fromDartColor(Colors.greenAccent),
      ),
    ];
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<charts.Series<BarChartModel, String>> series = [
          charts.Series(
            id: "financial",
            data: data,
            domainFn: (BarChartModel series, _) => series.date,
            measureFn: (BarChartModel series, _) => series.financial,
            colorFn: (BarChartModel series, _) => series.color,
          ),
        ];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: charts.BarChart(
            series,
            animate: true,
          ),
        );
      },
    );
  }
}
