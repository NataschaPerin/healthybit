//They are found in vegetables and fruits, legumes (beans, lentils, chickpeas) and cereals.
//Fiber provides no calories, although a portion is recovered by the action of gut bacteria on the end product, which is cellulose. They, by filling the stomach, give satiety, strengthen chewing, and literally heal the gut by facilitating intestinal transit and improving the bacterial flora.
//Fiber slows down and makes the absorption of carbohydrates contained in the same meal more constant so that the rise in blood sugar is more contained. In addition, fiber is proven to play a role in the prevention of many diseases including cancer.
//It is necessary to consume 0.5 grams of fiber per kilogram of weight daily in the early years of life, then 5 grams per day in adults.
//Statistics state that Italian children today eat very little fiber. This is a serious problem. Parents should enrich the table with varieties of vegetables and fruits,
//legumes and grains, so that they can find out which of these foods their children may like and then reintroduce them as much as possible. Fruit can also find a place at breakfast or snack time, and a serving of legumes may well replace the second plate

import 'package:flutter/material.dart';

class FiberPage extends StatelessWidget {
  const FiberPage({Key? key}) : super(key: key);

  static const route = '/Fiber/';
  static const routename = 'FiberPage';

  @override
  Widget build(BuildContext context) {
    print('${FiberPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
