import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  static const route = '/WaterPage/';
  static const routename = 'WaterPage';

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
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
                      _buildCard('assets/acqua.jpg'),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildTitle('WATER CONSUMPTION', Colors.black),
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
                    "If you’ve ever tried to lose weight, you’ve probably heard a lot about water and weight loss. Can drinking more water really help you lose weight? The short answer is yes -- and no. If you’re already well hydrated and getting plenty of water, getting more water into your diet probably won’t make a lot of difference. But if you’re going through your days a little -- or a lot -- dehydrated, as many people are, getting enough water could help. Water’s involved in every type of cellular process in your body, and when you’re dehydrated, they all run less efficiently -- and that includes your metabolism. Think of it like your car: if you have enough oil and gas, it will run more efficiently. It’s the same with your body. It’s also very hard for the body to tell the difference between hunger and thirst. So if you’re walking around feeling a gnawing sense of hunger, you might just be dehydrated. Try drinking a glass of water instead of grabbing a snack. Research has also shown that drinking a glass of water right before a meal helps you to feel more full and eat less."),
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
