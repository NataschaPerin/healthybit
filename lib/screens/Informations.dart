// pagina fatta tipo griglia dove sono contenute tutte le info utili per l'utente
//
import 'package:flutter/material.dart';
import 'package:healthybit/informations/protein.dart';

class InformationsPage extends StatelessWidget {
  const InformationsPage({Key? key}) : super(key: key);

  static const route = '/Informations/';
  static const routename = 'Informationspage';

  @override
  Widget build(BuildContext context) {
    print('${InformationsPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(InformationsPage.routename),
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
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, ProteinPage.route);
                  },
                  title: Text("Protein"),
                )),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[200],
            child: const Align(
              alignment: Alignment.center,
              child: Text('Carbohydrates'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[300],
            child: const Text('Lipids'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[400],
            child: const Text('Vitamins and Minerals'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[500],
            child: const Text('Water Consumption'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[600],
            child: const Text('Physical Activity'),
          ),
        ],
      ),
    );
  } //build

} //HomePage 