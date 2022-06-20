import 'package:flutter/material.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/ObjectivesList.dart';
import 'package:healthybit/screens/fitibit.dart';
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
        Fitbit.route: (context) => Fitbit(),
        HomePage.route: (context) => const HomePage(),
        // '/Signup/': (context) => SignUpPage(),
        // '/AcceptPrivacyTerms/': (context) => AcceptPrivacyTermsPage(),
        InformationsPage.route: (context) => const InformationsPage(),
        ObjectiveListPage.route: (context) => const ObjectiveListPage(),
        // '/Metabolic/': (context) => MetabolicPage(),
        // '/LogOut/': (context) => LogOutPage(),
        // '/ChallengesIndication/': (context) => ChallengesIndicationPage(),
        TrophiesPage.route: (context) => TrophiesPage(),
        EatingPage.route: (context) => EatingPage(),
        OverweightPage.route: (context) => OverweightPage(),
        SleepPage.route: (context) => SleepPage(),
        TrainingPage.route: (context) => TrainingPage(),
        EditProfilePage.route: (context) => EditProfilePage(),
        SettingsPage.route: (context) => SettingsPage(),
      },
    );
  } //build
}//MyApp
