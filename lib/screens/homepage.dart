// homepage dove saranno presenti tutte le informazioni principali dell'utente
// viene inoltre indicato il BMI con barra orizzontale

import 'package:flutter/material.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/Homepage/';
  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
          const UserAccountsDrawerHeader(
            accountName: Text('Giulio'),
            accountEmail: Text('Inserire mail'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('http://i.pravatar.cc/300'),
            ),
          ),
          const ListTile(
            title: Text('Objectives'),
            trailing: Icon(Icons.fitness_center),
          ),
          const Divider(thickness: 2),
          const ListTile(
            title: Text('Calories Managment'),
            trailing: Icon(Icons.balance_outlined),
          ),
          const Divider(thickness: 2),
          ListTile(
            title: const Text('Informations'),
            onTap: () {
              Navigator.pushNamed(context, InformationsPage.route);
            },
            trailing: const Icon(Icons.info_outline_rounded),
          ),
          const Divider(thickness: 2),
          ListTile(
            title: Text('Log Out'),
            trailing: Icon(Icons.logout),
            onTap: () => _toLoginPage(context),
          ),
          const Divider(thickness: 2),
        ],
      )),
    );
  } //build

  void _toLoginPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
  } //_toCalendarPage
} //HomePage
