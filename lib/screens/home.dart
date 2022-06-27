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
import 'package:healthybit/screens/reachyourgoal.dart';
import 'package:healthybit/screens/settings.dart';
import 'package:healthybit/screens/fitnessactivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:healthybit/utils/strings.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const route = '/Home/';
  static const routename = 'Home';

  @override
  Widget build(BuildContext context) {
    print('${Home.routename} built');
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(height: 20),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 65,
                  backgroundImage: AssetImage('assets/logo.png')),
              Card(
                  margin: EdgeInsets.all(20),
                  child: Column(children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            'Date of surgery',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 13, 114, 196)),
                          ),
                          SizedBox(width: 50),
                          Text(
                            'Initial weight',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 13, 114, 196)),
                          )
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text('30-06-2022     '),
                          SizedBox(width: 50),
                          Text('     140 kg        ')
                        ],
                      ),
                    ),
                    ListTile(
                        title: Text(
                          'Target weight',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 13, 114, 196)),
                        ),
                        subtitle: Text('90 kg')),
                  ])),
              Card(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  SizedBox(height: 20),
                  ListTile(
                    title: Center(
                        child: Text('Reach your goal ! ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 137, 13, 4),
                                fontSize: 30))),
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
                    child: Text('Do not give up! ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 25)),
                  ),
                  SizedBox(height: 10),
                ]),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('  Authorize  '),
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
                child: Text('Unauthorize'),
              ),
            ])));
  }
}
