// homepage dove saranno presenti tutte le informazioni principali dell'utente
// viene inoltre indicato il BMI con barra orizzontale

import 'package:flutter/material.dart';
import 'package:healthybit/screens/Informations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/Homepage/';
  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name:'),
            Text('Surname:'),
            Text('Age:'),
            Text('BMI:'),
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('Giulio'),
            accountEmail: Text('Inserire mail'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
            ),
          ),
          ListTile(
            title: Text('Objectives'),
            trailing: Icon(Icons.fitness_center),
          ),
          Divider(thickness: 2),
          ListTile(
            title: Text('Calories Managment'),
            trailing: Icon(Icons.balance_outlined),
          ),
          Divider(thickness: 2),
          ListTile(
            title: Text('Informations'),
            onTap: () {
              Navigator.pushNamed(context, InformationsPage.route);
            },
            trailing: Icon(Icons.info_outline_rounded),
          ),
          Divider(thickness: 2),
          ListTile(
            title: Text('Log Out'),
            trailing: Icon(Icons.logout),
          ),
          Divider(thickness: 2),
        ],
      )),
    );
  } //build

} //HomePage
