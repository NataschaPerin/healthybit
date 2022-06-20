// informazioni sul mangiare

import 'package:flutter/material.dart';

class EatingPage extends StatelessWidget {
  const EatingPage({Key? key}) : super(key: key);

  static const route = '/Eating/';
  static const routename = 'EatingPage';

  @override
  Widget build(BuildContext context) {
    print('${EatingPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
