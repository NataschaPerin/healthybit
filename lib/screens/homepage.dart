// homepage dove saranno presenti tutte le informazioni principali dell'utente
// viene inoltre indicato il BMI con barra orizzontale

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthybit/screens/BMIPage.dart';
import 'package:healthybit/screens/Calories.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/MetabolicPage.dart';
import 'package:healthybit/screens/editProfile.dart';
import 'package:healthybit/screens/fitibit.dart';
import 'package:healthybit/screens/reachyourgoal.dart';
import 'package:healthybit/screens/settings.dart';
import 'package:healthybit/screens/fitnessactivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:healthybit/utils/strings.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  double value = 0.5;
  static const route = '/Homepage/';
  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ListTile(
                title: Center(
          child: Text(
            'HealthyBit',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ))),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Giacomo Cappon'),
                accountEmail: Text('healthybit@gmail.com'),
                currentAccountPicture: Image.asset('assets/cappon.png'),
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('To BMI Calculator'),
                onTap: () => _toBMIPage(context),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('To Setting Page'),
                onTap: () => _toSettingPage(context),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Food Diary'),
                onTap: () => _toFoodDiary(context),
              ),
              ListTile(
                leading: Icon(Icons.fitbit),
                title: Text('Activity Diary'),
                onTap: () => _toActivityDiary(context),
              ),
              ListTile(
                leading: Icon(Icons.emoji_objects),
                title: Text('Goals'),
                onTap: () => _toReachYourGoal(context),
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('Informations'),
                onTap: () => _toInformationPage(context),
              ),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                  onTap: () => _toLoginPage(context)),
            ],
          ),
        ), //aggiumgere drawer con foto e logout in basso
        //logout in basso: column-expanded-listTile-style: new ListTileTheme(selectedColor: Colors.grigiochiaro,),
        endDrawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Dott.ssa Giò'),
              accountEmail: Text('dottoressagio@gmail.com'),
              currentAccountPicture: Image.asset('assets/dottoressa.jpg'),
            ),
          ]),
        ),
        //aggiungere endrawer con foto della nutrizionista e suoi dati e recapiti
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Card(
                  margin: EdgeInsets.all(20),
                  child: Column(children: [
                    InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: Column(children: [
                        SizedBox(height: 20),
                        ListTile(
                          title: Center(child: Text('Reach your goal ! ')),
                          subtitle: Center(
                            child: Container(
                              child: Text(
                                  DateTime.now().day.toString() +
                                      '-' +
                                      DateTime.now().month.toString() +
                                      '-' +
                                      DateTime.now().year.toString(),
                                  style: TextStyle(fontSize: 18)),
                              margin: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        Center(
                          child: Text('Today consume 1200 kcal'),
                        ),
                        SizedBox(height: 20),
                      ]),
                    ),
                  ])),
              ElevatedButton(
                child: Text('Authorize'),
                onPressed: () async {
                  // Authorize the app
                  String? userId = await FitbitConnector.authorize(
                      context: context,
                      clientID: Strings.fitbitClientID,
                      clientSecret: Strings.fitbitClientSecret,
                      redirectUri: Strings.fitbitRedirectUri,
                      callbackUrlScheme: Strings.fitbitCallbackScheme);
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  await FitbitConnector.unauthorize(
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                  );
                },
                child: Text('Tap to unauthorize'),
              ),
            ])));
  }

  void _toBMIPage(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then push the ProfilePage
    Navigator.pushNamed(context, BMIPage.route);
  } //_toProfilePage

  void _toSettingPage(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then push the CalendarPage
    Navigator.pushNamed(context, SettingsPage.route);
  } //_toCalendarPage

  void _toFoodDiary(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, CaloriesPage.route);
  } //_toCalendarPage

  void _toActivityDiary(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, FitnessActivityPage.route);
  } //_toCalendarPage

  void _toReachYourGoal(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, ReachyourgoalPage.route);
  } //_toCalendarPage

  void _toInformationPage(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, InformationsPage.route);
  } //_toCalendarPage

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
