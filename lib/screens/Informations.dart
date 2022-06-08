// pagina fatta tipo griglia dove sono contenute tutte le info utili per l'utente
//
import 'package:flutter/material.dart';

class InformationsPage extends StatelessWidget {
  const InformationsPage({Key? key}) : super(key: key);

  static const route = '/Informations/';
  static const routename = 'Informationspage';

  @override
  Widget build(BuildContext context) {
    print('${InformationsPage.routename} built');
    return Scaffold(
        appBar: AppBar(
          title: Text(InformationsPage.routename),
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
              color: Colors.teal[100],
              child: Align(
                alignment: Alignment.center,
                child: const Text(
                    "Why is it suggested to sleep from 7 to 9 hours per night?"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: Align(
                alignment: Alignment.center,
                child: const Text('Heed not the rabble'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Sound of screams but the'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Who scream'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: const Text('Revolution is coming...'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: const Text('Revolution, they...'),
            ),
          ],
        )
        // children: [allItems],
        );
  } //build

} //HomePage 