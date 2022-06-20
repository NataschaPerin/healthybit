// pagina dei trofei

import 'package:flutter/material.dart';

class TrophiesPage extends StatelessWidget {
  const TrophiesPage({Key? key}) : super(key: key);

  static const route = '/Trophies/';
  static const routename = 'TrophiesPage';

  @override
  Widget build(BuildContext context) {
    print('${TrophiesPage.routename} built');
    return Scaffold(
        appBar: AppBar(
          title: const Text(TrophiesPage.routename),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 137, 137, 0),
              child: const Align(
                alignment: Alignment.center,
                child: Text("Sleepover Club"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 229, 119, 23),
              child: const Align(
                alignment: Alignment.center,
                child: Text('You the GOAT'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 224, 23, 23),
              child: const Align(
                alignment: Alignment.center,
                child: Text('Chef Ramsay'),
              ),
            ),
          ],
        )
        // children: [allItems],
        );
  } //build

} //InformationsPage