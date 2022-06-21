import 'package:flutter/material.dart';
import 'package:healthybit/screens/Calories.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/editProfile.dart';
import 'package:healthybit/screens/scorepage.dart';
import 'package:healthybit/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:healthybit/screens/fitibit.dart';
import 'package:healthybit/utils/strings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:healthybit/database/entities/food.dart';
import 'package:healthybit/repositories/databaseRepository.dart';
import 'package:healthybit/widgets/formTiles.dart';
import 'package:healthybit/widgets/formSeparator.dart';
import 'package:healthybit/utils/formats.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatefulWidget {
  //We are passing the Meal to be edited. If it is null, the business logic will know that we are adding a new
  //Meal instead.
  final Parameter? parameter;

  //MealPage constructor
  ResultsPage({Key? key, required this.parameter}) : super(key: key);

  static const route = '/ResultsPage';
  static const routeDisplayName = 'Results page';

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    //Print the route display name for debugging
    print('${ResultsPage.routeDisplayName} built');
    //The page is composed of a form. An action in the AppBar is used to validate and save the information provided by the user.
    //A FAB is showed to provide the "delete" functinality. It is showed only if the meal already exists.
    return Scaffold(
        appBar: AppBar(
          title: Text(ResultsPage.routeDisplayName),
          actions: [
            IconButton(
              onPressed: () => _validateAndSave(context),
              icon: Icon(Icons.done),
            )
          ],
        ),
        body: Center(
          child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
            //The logic is to query the DB for the entire list of Meal using dbr.findAllMeals()
            //and then populate the ListView accordingly.
            //We need to use a FutureBuilder since the result of dbr.findAllMeals() is a Future.
            return FutureBuilder(
              initialData: null,
              future: dbr.findAllParameters(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<Parameter>;
                  //If the Meal table is empty, show a simple Text, otherwise show the list of meals using a ListView.
                  return data.length == 0
                      ? Text('The parameters list is currently empty')
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, parameterIndex) {
                            //Here, we are using a Card to show a Meal
                            return Card(
                              elevation: 5,
                              child: ListTile(
                                leading: Icon(MdiIcons.pasta),
                                trailing: Icon(MdiIcons.noteEdit),
                                title:
                                    Text('BMI : ${data[parameterIndex].BMI}'),
                                subtitle: Text(
                                    '${Formats.fullDateFormatNoSeconds.format(data[parameterIndex].date)}'),
                                //When a ListTile is tapped, the user is redirected to the MealPage, where it will be able to edit it.
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
        ));
  }

  //build
  void _validateAndSave(BuildContext context) async {
    Parameter newParameter = Parameter(
        null,
        widget.parameter!.personWeight,
        widget.parameter!.Height,
        widget.parameter!.BMI,
        widget.parameter!.date);
    await Provider.of<DatabaseRepository>(context, listen: false)
        .insertParameter(newParameter);
    Navigator.pop(context);
  }
}
