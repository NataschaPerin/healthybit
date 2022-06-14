import 'package:flutter/material.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/ObjectivesList.dart';
import 'package:healthybit/screens/homepage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.route,
      //This maps names to the set of routes within the app
      routes: {
        LoginPage.route: (context) => const LoginPage(),
        HomePage.route: (context) => const HomePage(),
        // '/Signup/': (context) => SignUpPage(),
        // '/AcceptPrivacyTerms/': (context) => AcceptPrivacyTermsPage(),
        InformationsPage.route: (context) => const InformationsPage(),
        ObjectiveListPage.route: (context) => const ObjectiveListPage(),
        // '/Metabolic/': (context) => MetabolicPage(),
        // '/LogOut/': (context) => LogOutPage(),
        // '/ChallengesIndication/': (context) => ChallengesIndicationPage(),
        // TrophiesPage.route: (context) => TrophiesPage(),
      },
    );
  } //build
}//MyApp
