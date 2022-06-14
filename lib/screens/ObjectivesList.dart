//  pagina con lista obiettivi (ex.ore di sonno e numero di passi giornaliero)
// con eventuali informazioni in merito al tipo di obiettivo
// homepage dove saranno presenti tutte le informazioni principali dell'utente
// viene inoltre indicato il BMI con barra orizzontale

import 'package:flutter/material.dart';

class ObjectiveListPage extends StatelessWidget {
  const ObjectiveListPage({Key? key}) : super(key: key);

  static const route = '/ObjectiveList/';
  static const routename = 'ObjectiveListpage';

  @override
  Widget build(BuildContext context) {
    print('${ObjectiveListPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(ObjectiveListPage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Sleep Time:'),
            Text('Step Counter:'),
          ],
        ),
      ),
    );
  } //build

} //HomePage
