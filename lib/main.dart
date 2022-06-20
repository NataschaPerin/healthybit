import 'package:flutter/material.dart';
import 'package:healthybit/informations/fiber.dart';
import 'package:healthybit/informations/protein.dart';
import 'package:healthybit/informations/carbohydrates.dart';
import 'package:healthybit/informations/lipid.dart';
import 'package:healthybit/informations/vitaminsminerals.dart';
import 'package:healthybit/informations/waterconsumption.dart';
import 'package:healthybit/screens/BMI.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/ObjectivesList.dart';
import 'package:healthybit/screens/TrophiesPage.dart';
import 'package:healthybit/screens/editProfile.dart';
import 'package:healthybit/screens/fitibit.dart';
import 'package:healthybit/screens/homepage.dart';
import 'package:healthybit/screens/score.dart';
import 'package:healthybit/screens/settings.dart';

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
        ProteinPage.route: (context) => ProteinPage(),
        CarbohydratesPage.route: (context) => CarbohydratesPage(),
        LipidPage.route: (context) => LipidPage(),
        FiberPage.route: (context) => FiberPage(),
        VitaminsMineralsPage.route: (context) => VitaminsMineralsPage(),
        WaterConsumptionPage.route: (context) => WaterConsumptionPage(),
        EditProfilePage.route: (context) => EditProfilePage(),
        SettingsPage.route: (context) => SettingsPage(),
        BMIPage.route: (context) => BMIPage(),
      },
    );
  } //build
}//MyApp
