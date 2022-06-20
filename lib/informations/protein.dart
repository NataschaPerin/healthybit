// informazioni sul mangiare

import 'package:flutter/material.dart';

class ProteinPage extends StatelessWidget {
  const ProteinPage({Key? key}) : super(key: key);

  static const route = '/Protein/';
  static const routename = 'ProteinPage';

  @override
  Widget build(BuildContext context) {
    print('${ProteinPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
