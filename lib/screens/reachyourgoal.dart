import 'dart:core';
import 'dart:ffi';
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthybit/database/daos/foodDao.dart';
import 'package:provider/provider.dart';
import 'package:healthybit/database/entities/food.dart';
import 'package:healthybit/repositories/databaseRepository.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:healthybit/utils/strings.dart';

class ReachyourgoalPage extends StatefulWidget {
  ReachyourgoalPage({Key? key}) : super(key: key);

  static const route = '/Reachyourgoalpage/';
  static const routename = 'Reachyourgoalpage';

  @override
  State<ReachyourgoalPage> createState() => _ReachyourgoalPageState();
}

class _ReachyourgoalPageState extends State<ReachyourgoalPage> {
  double intake = 0;
  double outtake = 0;
  @override
  Widget build(BuildContext context) {
    //Print the route display name for debugging
    print('${ReachyourgoalPage.routename} built');
    return Scaffold(
        body: Center(
            //We will show the Meal table with a ListView.
            //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
            //entries are deleted, created or updated.
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          //The logic is to query the DB for the entire list of Meal using dbr.findAllMeals()
          //and then populate the ListView accordingly.
          //We need to use a FutureBuilder since the result of dbr.findAllFoods() is a Future.
          return FutureBuilder(
              initialData: null,
              future: dbr.findAllFoods(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<Food>;
                  //If the Food table is empty, show a simple Text, otherwise show the list of foods using a ListView.
                  if (data.length == 0) {
                    return Text('Start eat!');
                  } else {
                    List<double> calories_in = _toSelect(context, data);
                    intake = _toIntake(context, calories_in);
                    return Card(
                      elevation: 10,
                      color: Color.fromARGB(255, 241, 30, 15),
                      child: ListTile(
                        leading: Icon(MdiIcons.foodForkDrink),
                        title: Text('CALORIES INTAKE:',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20)),
                        subtitle: Text(_toCalculate(context, calories_in),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20)),
                      ), //ListTile
                    ); //Card
                  } //else
                } else {
                  return CircularProgressIndicator();
                } //else
              } //builder
              ); //futurebuilder
        } //Consumer
            ),
        FutureBuilder(
            initialData: null,
            future: _toConsume(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final calories_out = snapshot.data as String;
                outtake = double.parse(calories_out);
                return Card(
                    elevation: 10,
                    color: Color.fromARGB(255, 20, 247, 28),
                    child: ListTile(
                        leading: Icon(MdiIcons.fire),
                        title: Text('CALORIES OUTTAKE:',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20)),
                        subtitle: Text(calories_out + '  kcal',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20))));
              } else {
                return Text('Control your fitbit authorization');
              }
            }),
        FutureBuilder(
            initialData: null,
            future: _toConsume(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final calories_out = snapshot.data as String;
                outtake = double.parse(calories_out);
                return Card(
                    elevation: 10,
                    color: Color.fromARGB(255, 54, 215, 243),
                    child: ListTile(
                        leading: Icon(MdiIcons.pacMan),
                        title: Text(_toComparation(context, intake, outtake),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20)),
                        subtitle: Text('',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20))));
              } else {
                return Text('Loading...');
              }
            })
      ],
    ) //Center
            ));
  } //Scaffold

  List<double> _toSelect(BuildContext context, List<Food> data) {
    List<double> calories_in = [];
    for (var i = 0; i < data.length; i++) {
      calories_in.add(data[i].calories);
    }
    return calories_in;
  }

  String _toCalculate(BuildContext context, List<double> calories_in) {
    double sum = 0;
    for (var i = 0; i < calories_in.length; i++) {
      sum += calories_in[i];
    }
    return sum.toString() + '  kcal';
  }

  double _toIntake(BuildContext context, List<double> calories_in) {
    double sum = 0;
    for (var i = 0; i < calories_in.length; i++) {
      sum += calories_in[i];
    }
    return sum;
  }

  Future<String> _toConsume(BuildContext context) async {
    //Instantiate a proper data manager
    FitbitActivityTimeseriesDataManager fitbitActivityTimeseriesDataManager =
        FitbitActivityTimeseriesDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
      type: 'calories',
    );
    //Fetch data
    final caloriesData = await fitbitActivityTimeseriesDataManager
        .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now(),
      userID: '7ML2XV',
      resource: fitbitActivityTimeseriesDataManager.type,
    )) as List<FitbitActivityTimeseriesData>;
    return caloriesData[0].value.toString();
  }

  String _toComparation(BuildContext context, cal_in, cal_out) {
    String str = '';
    if (cal_in > cal_out) {
      str = 'You are in surplus by ${cal_in - cal_out}!';
    } else if (cal_in == cal_out) {
      str = 'You are in perfect balance!';
    } else {
      str = 'You are in deficit by ${cal_out - cal_in}!';
    }
    return str;
  }
}
