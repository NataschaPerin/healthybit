// If you’ve ever tried to lose weight, you’ve probably heard a lot about water and weight loss. Can drinking more water really help you lose weight? The short answer is yes -- and no.
// If you’re already well hydrated and getting plenty of water, getting more water into your diet probably won’t make a lot of difference. But if you’re going through your days a little -- or a lot -- dehydrated, as many people are, getting enough water could help.
// Water’s involved in every type of cellular process in your body, and when you’re dehydrated, they all run less efficiently -- and that includes your metabolism. Think of it like your car: if you have enough oil and gas, it will run more efficiently. It’s the same with your body.
// It’s also very hard for the body to tell the difference between hunger and thirst. So if you’re walking around feeling a gnawing sense of hunger, you might just be dehydrated. Try drinking a glass of water instead of grabbing a snack
// Research has also shown that drinking a glass of water right before a meal helps you to feel more full and eat less.

import 'package:flutter/material.dart';

class WaterConsumptionPage extends StatelessWidget {
  const WaterConsumptionPage({Key? key}) : super(key: key);

  static const route = '/WaterConsumption/';
  static const routename = 'WaterConsumptionPage';

  @override
  Widget build(BuildContext context) {
    print('${WaterConsumptionPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
