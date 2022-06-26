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
import 'package:healthybit/screens/home.dart';
import 'package:healthybit/screens/progressPage.dart';
import 'package:healthybit/screens/reachyourgoal.dart';
import 'package:healthybit/screens/settings.dart';
import 'package:healthybit/screens/fitnessactivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:healthybit/utils/strings.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const route = '/Homepage/';
  static const routename = 'Homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), EditProfilePage(), SettingsPage()];

  void _onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
              currentAccountPictureSize: Size.square(100),
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('BMI Calculator'),
              onTap: () => _toBMIPage(context),
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Food Diary'),
              onTap: () => _toFoodDiary(context),
            ),
            ListTile(
              leading: Icon(Icons.fitness_center_outlined),
              title: Text('Activity Diary'),
              onTap: () => _toActivityDiary(context),
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text('Goals'),
              onTap: () => _toReachYourGoal(context),
            ),
            ListTile(
              leading: Icon(Icons.priority_high),
              title: Text('Progress'),
              onTap: () => _toProgressPage(context),
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text('Informations'),
              onTap: () => _toInformationPage(context),
            ),
            SizedBox(height: 140),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () => _toLoginPage(context),
                tileColor: Color.fromARGB(185, 234, 230, 230)),
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
          currentAccountPictureSize: Size.square(125),
        ),
        Card(
            margin: EdgeInsets.all(20),
            child: Column(children: [
              ListTile(
                title: Row(
                  children: [
                    Text('Name'),
                    SizedBox(width: 50),
                    Text('Surname')
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text('Giorgia'),
                    SizedBox(width: 50),
                    Text('D\'Urso')
                  ],
                ),
              ),
              ListTile(
                  title: Text('Email'),
                  subtitle: Text('dottoressagio@gmail.com')),
              ListTile(
                  title: Text('Telephone'), subtitle: Text('+39 123 456 7890')),
            ])),
        Card(
            margin: EdgeInsets.all(20),
            child: Table(
              border: TableBorder.all(
                  width: 2,
                  color: Color.fromARGB(115, 15, 117, 235)), //table border
              children: [
                TableRow(children: [
                  TableCell(
                      child: Text("Schedule",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  TableCell(child: Text(""))
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text("Monday",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  TableCell(
                      child: Text("09:00-12:30", textAlign: TextAlign.center))
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text("Thusday",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  TableCell(
                      child: Text("08:30-12:30", textAlign: TextAlign.center))
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text("Wednesday",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  TableCell(
                      child: Text("08:30-12:30", textAlign: TextAlign.center))
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text("Thursday",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  TableCell(
                      child: Text("16:00-19:00", textAlign: TextAlign.center))
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text("Friday",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  TableCell(
                      child: Text("16:00-19:30", textAlign: TextAlign.center))
                ]),
              ],
            ))
      ])),

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }

  void _toBMIPage(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then push the ProfilePage
    Navigator.pushNamed(context, BMIPage.route);
  }

  //_toCalendarPage
  void _toFoodDiary(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, CaloriesPage.route);
  }

  //_toCalendarPage
  void _toActivityDiary(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, FitnessActivityPage.route);
  }

  //_toCalendarPage
  void _toReachYourGoal(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, ReachyourgoalPage.route);
  }

  //_toProgressPage
  void _toProgressPage(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, ProgressPage.route);
  }

  //_toCalendarPage
  void _toInformationPage(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pushNamed(context, InformationsPage.route);
  }

  //_toCalendarPage
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
