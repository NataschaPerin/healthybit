// informazioni sul rischio di essere sovrappeso

import 'package:flutter/material.dart';

class OverweightPage extends StatelessWidget {
  const OverweightPage({Key? key}) : super(key: key);

  static const route = '/Overweight/';
  static const routename = 'OverweightPage';

  @override
  Widget build(BuildContext context) {
    print('${OverweightPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
