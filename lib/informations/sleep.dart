// informazioni sul perché si deve dormire un certo numero di ore

import 'package:flutter/material.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({Key? key}) : super(key: key);

  static const route = '/Sleep/';
  static const routename = 'SleepPage';

  @override
  Widget build(BuildContext context) {
    print('${SleepPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
