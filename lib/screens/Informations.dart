// pagina fatta tipo griglia dove sono contenute tutte le info utili per l'utente
//
import 'package:flutter/material.dart';

class InformationsPage extends StatelessWidget {
  const InformationsPage({Key? key}) : super(key: key);

  static const route = '/Informations/';
  static const routename = 'Informationspage';
  static const BSplate = "assets/BSplate.jpg";

  @override
  Widget build(BuildContext context) {
    print('${InformationsPage.routename} built');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 250, 151),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 400),
            color: Colors.green,
            child: Image.asset(BSplate, fit: BoxFit.fill),
          ),
          ListTile(
            title: Text(
              'The Balanced Plate',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('General directions on how to compose your dish'),
          ),
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Protein"),
                ),
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
        ],
      )
          // children: [allItems],
          ),
    );
  } //build

} //HomePage 