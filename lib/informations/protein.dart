// informazioni sul mangiare

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProteinPage extends StatefulWidget {
  const ProteinPage({Key? key}) : super(key: key);

  static const route = '/Protein/';
  static const routename = 'ProteinPage';

  @override
  State<ProteinPage> createState() => _ProteinPageState();
}

class _ProteinPageState extends State<ProteinPage> {
  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 183, 183),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildCard('assets/uovo.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/carne.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/pesce.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/piselli.jpg'),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildTitle('PROTEINS', Colors.black),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red, width: 5.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ]),
                child: Text(
                    "Proteins are the building blocks of which living organisms are made: the amino acids of which they are composed make up both cells and the enzymes and hormones that regulate their functioning. Amino acids can be manufactured by the body; others, called 'essential', must be taken in with food. Proteins in foods of animal origin (red and white meat, fish, milk, etc.) are called 'animal proteins,' while those in plant foods especially legumes, including soybeans, and cereals) are called 'plant' proteins. Protein should account for 10-15% of the total caloric requirement equally divided between the two categories just mentioned. These building blocks are especially needed during growth: after the first year of life the amount varies from 1.5 to 2 grams of protein per day per kilogram of body weight. Caution: excessive protein intake can strain kidney function."),
              ),
            ),
          ]),
        ));
  }

  Widget _buildCard(String url) => Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 5.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
            ]),
        child: Material(
          color: Colors.white,
          child: Image.asset(url),
        ),
      );

  Widget _buildTitle(String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            indent: 20.0,
            endIndent: 10.0,
            thickness: 2,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Expanded(
          child: Divider(
            indent: 20.0,
            endIndent: 10.0,
            thickness: 2,
            color: color,
          ),
        ),
      ],
    );
  }
}
