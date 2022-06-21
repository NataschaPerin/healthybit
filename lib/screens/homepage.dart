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
import 'package:healthybit/screens/fitibit.dart';
import 'package:healthybit/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:healthybit/utils/strings.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
                child: Text('Start')),
            ElevatedButton(
                child: Text('Authorization'),
                onPressed: () async {
                  final userId = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fitbit()));
                }),
            ElevatedButton(
              child: Text('Get the calories'),
              onPressed: () async {
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );

                //Fetch data
                final stepsData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                  date: DateTime.now().subtract(Duration(days: 1)),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;

                // Use them as you want
                final snackBar = SnackBar(
                    content: Text(
                        'Yesterday you walked ${stepsData[0].value} steps!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
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
