// homepage dove saranno presenti tutte le informazioni principali dell'utente
// viene inoltre indicato il BMI con barra orizzontale

// homepage dove saranno presenti tutte le informazioni principali dell'utente
// viene inoltre indicato il BMI con barra orizzontale

import 'package:flutter/material.dart';
import 'package:healthybit/screens/ActivityPage.dart';
import 'package:healthybit/screens/BMIPage.dart';
import 'package:healthybit/screens/Calories.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/MetabolicPage.dart';
import 'package:healthybit/screens/editProfile.dart';
import 'package:healthybit/screens/settings.dart';
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
          children: [
            Text('Name:'),
            Text('Surname:'),
            Text('Age:'),
            Text('BMI:'),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, CaloriesPage.route),
                child: Text('Start'))
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Giacomo Cappon'),
            accountEmail: Text('healthybit@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('http://i.pravatar.cc/300'),
            ),
          ),
          ListTile(
            title: Text('Food Diary'),
            trailing: Icon(Icons.balance_outlined),
            onTap: () {
              Navigator.pushNamed(context, CaloriesPage.route);
            },
          ),
          const Divider(thickness: 2),
          ListTile(
            title: Text('Activity Diary'),
            trailing: Icon(Icons.balance_outlined),
            onTap: () {
              Navigator.pushNamed(context, ActivityPage.route);
            },
          ),
          ListTile(
            title: Text('BMI calculator'),
            trailing: Icon(Icons.calculate),
            onTap: () {
              Navigator.pushNamed(context, BMIPage.route);
            },
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
            title: Text('Edit Profile'),
            trailing: Icon(Icons.app_registration_outlined),
            onTap: () {
              Navigator.pushNamed(context, EditProfilePage.route);
            },
          ),
          const Divider(thickness: 2),
          ListTile(
            title: Text('Settings'),
            trailing: Icon(Icons.settings),
            onTap: () {
              Navigator.pushNamed(context, SettingsPage.route);
            },
          ),
          const Divider(thickness: 2),
          const ListTile(
            title: Text('FitnessActivity'),
            trailing: Icon(Icons.fitness_center),
          ),
          const Divider(thickness: 2),
          ListTile(
              title: Text('Log Out'),
              trailing: Icon(Icons.logout),
              onTap: () => _toLoginPage(context)),
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
  }
}
