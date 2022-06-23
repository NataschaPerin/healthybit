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
          //We need to use a FutureBuilder since the result of dbr.findAllMeals() is a Future.
          return FutureBuilder(
              initialData: null,
              future: dbr.findAllFoods(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<Food>;
                  //If the Meal table is empty, show a simple Text, otherwise show the list of meals using a ListView.
                  if (data.length == 0) {
                    return Text('Start eat!');
                  } else {
                    List<double> calories_in = _toSelect(context, data);
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(MdiIcons.foodForkDrink),
                        title: Text('CALORIES INTAKE:'),
                        subtitle: Text(_toCalculate(context, calories_in)),
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
                final data = snapshot.data as String;
                return Card(
                    elevation: 5,
                    child: ListTile(
                        leading: Icon(MdiIcons.fire),
                        title: Text('CALORIES OUTTAKE:'),
                        subtitle: Text(data + '  kcal')));
              } else {
                return Text('Control your fitbit authorization');
              }
            })
      ],
    ) //Center
            )); //Scaffold
  }

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
}
