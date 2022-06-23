import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:healthybit/database/entities/food.dart';
import 'package:healthybit/repositories/databaseRepository.dart';
import 'package:healthybit/screens/MetabolicPage.dart';
import 'package:healthybit/utils/formats.dart';
import 'package:provider/provider.dart';
import 'dart:math';

//Homepage screen. It will show the list of meals.
class CaloriesPage extends StatelessWidget {
  CaloriesPage({Key? key}) : super(key: key);

  static const route = '/CaloriesPage';
  static const routeDisplayName = 'Caloriespage';

  //double todaycalories = 0;

  @override
  Widget build(BuildContext context) {
    //Print the route display name for debugging
    print('${CaloriesPage.routeDisplayName} built');

    return Scaffold(
        appBar: AppBar(
          title: Text(CaloriesPage.routeDisplayName),
        ),
        body: Center(
          //We will show the Meal table with a ListView.
          //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
          //entries are deleted, created or updated.
          child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
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
                  return data.length == 0
                      ? Text('The food list is currently empty')
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, foodIndex) {
                            //todaycalories =
                            //(todaycalories + data[foodIndex].calories);
                            //print('$todaycalories');
                            //Here, we are using a Card to show a Meal
                            return Card(
                              elevation: 5,
                              child: ListTile(
                                leading: Icon(MdiIcons.food),
                                trailing: Icon(MdiIcons.noteEdit),
                                title: Text(
                                    'CALORIES : ${data[foodIndex].calories}'),
                                subtitle: Text(
                                    '${Formats.fullDateFormatNoSeconds.format(data[foodIndex].dateTime)}'),
                                //When a ListTile is tapped, the user is redirected to the MealPage, where it will be able to edit it.
                                onTap: () =>
                                    _toMetabolicPage(context, data[foodIndex]),
                              ),
                            );
                          });
                } //if
                else {
                  return CircularProgressIndicator();
                } //else
              }, //FutureBuilder builder
            );
          } //Consumer-builder
              ),
        ),
        //Here, I'm using a FAB to let the user add new meals.
        //Rationale: I'm using null as meal to let MealPage know that we want to add a new meal.
        floatingActionButton: FloatingActionButton(
          child: Icon(MdiIcons.plus),
          onPressed: () => _toMetabolicPage(context, null),
        ));
  } //build

  //Utility method to navigate to MetabolicPage
  void _toMetabolicPage(BuildContext context, Food? food) {
    Navigator.pushNamed(context, MetabolicPage.route,
        arguments: {'food': food});
  } //_toMetabolicPage
} //CaloriesPage
