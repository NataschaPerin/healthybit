// informazioni sul rischio di essere sovrappeso
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarbohydratesPage extends StatefulWidget {
  const CarbohydratesPage({Key? key}) : super(key: key);

  static const route = '/CarbohydratesPage/';
  static const routename = 'CarbohydratesPage';

  @override
  State<CarbohydratesPage> createState() => _CarbohydratesPageState();
}

class _CarbohydratesPageState extends State<CarbohydratesPage> {
  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 183, 183),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildCard('assets/pasta.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/pane.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/patate.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/banana.jpg'),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildTitle('CARBOHYDRATES', Colors.black),
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
                    "Carbohydrates are the most important source of energy for the body and are the basis of the Mediterranean diet. Carbohydrates are not the enemy of those with diabetes, but the latter must learn to prefer (as is advisable for everyone) complex carbohydrates or starches that are absorbed more slowly. These are found in cereal derivatives (pasta, rice, bread) or legumes (beans, chickpeas, lentils, broad beans, peas). Potatoes require special attention because although they contain starches, which are complex carbohydrates, they are quickly metabolized and converted into glucose. Better instead to reduce the intake of simple carbohydrates, which are almost immediately converted into glucose in the blood. Simple ones are those found in sugar, honey, jam, fruit (sucrose and fructose), as well as milk and yogurt (lactose), and those added to sweet drinks. Between 55% and 65% of calories taken in each day should come from carbohydrates of which only 10-15% should come from so-called simple sugars."),
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
