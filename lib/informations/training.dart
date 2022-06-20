// informazioni su come allenarsi al meglio

import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({Key? key}) : super(key: key);

  static const route = '/Training/';
  static const routename = 'TrainingPage';

  @override
  Widget build(BuildContext context) {
    print('${TrainingPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('1.The workout should push you, but not over the edge'),
          Text('2.Think long-term'),
          Text('3.Push yourself'),
          Text('4.Listen to your body'),
          Text('5.Set realistic goals'),
          Text('6.Mix it up'),
          Text('7.Stick with it'),
          Text('8.Get the most out of each exercise'),
          Text('9.Give your body time to recover'),
          Text('10.Training is just one piece of the puzzle'),
        ]),
      ),
    );
  }
}
