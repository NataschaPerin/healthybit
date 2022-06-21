import 'package:flutter/material.dart';
import 'package:healthybit/database/entities/food.dart';
import 'package:healthybit/informations/carbohydrates.dart';
import 'package:healthybit/informations/fiber.dart';
import 'package:healthybit/informations/lipid.dart';
import 'package:healthybit/informations/protein.dart';
import 'package:healthybit/informations/vitaminsminerals.dart';
import 'package:healthybit/informations/waterconsumption.dart';
import 'package:healthybit/screens/ActivityPage.dart';
import 'package:healthybit/screens/BMIPage.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/MetabolicPage.dart';
import 'package:healthybit/screens/Results.dart';
import 'package:healthybit/screens/editProfile.dart';
import 'package:healthybit/screens/fitibit.dart';
import 'package:healthybit/screens/homepage.dart';
import 'package:healthybit/screens/scorepage.dart';
import 'package:healthybit/screens/settings.dart';
import 'package:healthybit/screens/Calories.dart';
import 'package:healthybit/database/database.dart';
import 'package:healthybit/repositories/databaseRepository.dart';
import 'package:provider/provider.dart';
import 'package:healthybit/database/entities/food.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  final databaseRepository = DatabaseRepository(database: database);

  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //This specifies the app entrypoint
        initialRoute: LoginPage.route,
        //This maps names to the set of routes within the app
        routes: {
          LoginPage.route: (context) => const LoginPage(),
          HomePage.route: (context) => HomePage(),
          InformationsPage.route: (context) => const InformationsPage(),
          CarbohydratesPage.route: (context) => CarbohydratesPage(),
          ProteinPage.route: (context) => ProteinPage(),
          FiberPage.route: (context) => FiberPage(),
          LipidPage.route: (context) => LipidPage(),
          VitaminsMineralsPage.route: (context) => VitaminsMineralsPage(),
          WaterConsumptionPage.route: (context) => WaterConsumptionPage(),
          EditProfilePage.route: (context) => EditProfilePage(),
          SettingsPage.route: (context) => SettingsPage(),
          ActivityPage.route: (context) => ActivityPage(),
          BMIPage.route: (context) => BMIPage(),
          Fitbit.route: (context) => Fitbit()
        },
        onGenerateRoute: (settings) {
          if (settings.name == CaloriesPage.route) {
            return MaterialPageRoute(builder: (context) {
              return CaloriesPage();
            });
          } else if (settings.name == MetabolicPage.route) {
            final args = settings.arguments as Map;
            return MaterialPageRoute(builder: (context) {
              return MetabolicPage(food: args['food']);
            });
          } else if (settings.name == ResultsPage.route) {
            final args1 = settings.arguments as Map;
            return MaterialPageRoute(builder: (context) {
              return ResultsPage(parameter: args1['parameter']);
            });
          } else {
            return null;
          }
        });
  } //build
}//MyApp
