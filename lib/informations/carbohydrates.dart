// informazioni sul rischio di essere sovrappeso
// Carbohydrates are the most important source of energy for the body and are the basis of the Mediterranean diet.
// Carbohydrates are not the enemy of those with diabetes, but the latter must learn to prefer (as is advisable for everyone) complex carbohydrates or starches that are absorbed more slowly. These are found in cereal derivatives (pasta, rice, bread) or legumes (beans, chickpeas, lentils, broad beans, peas).
// Potatoes require special attention because although they contain starches, which are complex carbohydrates, they are quickly metabolized and converted into glucose.
// Better instead to reduce the intake of simple carbohydrates, which are almost immediately converted into glucose in the blood. Simple ones are those found in sugar, honey, jam, fruit (sucrose and fructose), as well as milk and yogurt (lactose), and those added to sweet drinks.
// Between 55% and 65% of calories taken in each day should come from carbohydrates of which only 10-15% should come from so-called simple sugars

import 'package:flutter/material.dart';

class CarbohydratesPage extends StatelessWidget {
  const CarbohydratesPage({Key? key}) : super(key: key);

  static const route = '/Carbohydrates/';
  static const routename = 'CarbohydratesPage';

  @override
  Widget build(BuildContext context) {
    print('${CarbohydratesPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
