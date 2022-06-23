import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:healthybit/database/entities/food.dart';
import 'package:healthybit/repositories/databaseRepository.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:healthybit/utils/formats.dart';
import 'package:healthybit/screens/BMIPage.dart';

class ProgressPage extends StatelessWidget {
  ProgressPage({Key? key}) : super(key: key);

  static const route = '/Progresspage/';
  static const routename = 'Progresspage';

  @override
  Widget build(BuildContext context) {
    print('${ProgressPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(ProgressPage.routename),
      ),
      body: Center(child:
          //We will show the todo table with a ListView.
          //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
          //entries are deleted or created.
          Consumer<DatabaseRepository>(builder: (context, dbr, child) {
        //The logic is to query the DB for the entire list of Todo using dbr.findAllTodos()
        //and then populate the ListView accordingly.
        //We need to use a FutureBuilder since the result of dbr.findAllTodos() is a Future.
        return FutureBuilder(
          initialData: null,
          future: dbr.findAllParameters(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as List<Parameter>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, todoIndex) {
                    final todo = data[todoIndex];
                    return Card(
                        elevation: 5,
                        //Here we use a Dismissible widget to create a nicer UI.
                        child: Dismissible(
                            //Just create a dummy unique key
                            key: UniqueKey(),
                            //This is the background to show when the ListTile is swiped
                            background: Container(color: Colors.red),
                            //The ListTile is used to show the Todo entry
                            child: ListTile(
                              leading: Icon(MdiIcons.note),
                              title: Text('BMI: ${data[todoIndex].BMI}'),
                              subtitle: Text(
                                  '${Formats.fullDateFormatNoSeconds.format(data[todoIndex].date)}'),
                              //If the ListTile is tapped, it is deleted
                            ),
                            onDismissed: (direction) async {
                              //No need to use a Consumer, we are just using a method of the DatabaseRepository
                              await Provider.of<DatabaseRepository>(context,
                                      listen: false)
                                  .removeParameter(todo);
                            }));
                  });
            } else {
              //A CircularProgressIndicator is shown while the list of Todo is loading.
              return CircularProgressIndicator();
            } //else
          }, //builder of FutureBuilder
        );
      })),
    );
  } //build
}
