import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiberPage extends StatefulWidget {
  const FiberPage({Key? key}) : super(key: key);

  static const route = '/FiberPage/';
  static const routename = 'FiberPage';

  @override
  State<FiberPage> createState() => _FiberPageState();
}

class _FiberPageState extends State<FiberPage> {
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
                      _buildCard('assets/piselli.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/fagioli.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/avena.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/ceci.jpg'),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildTitle('FIBERS', Colors.black),
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
                    "They are found in vegetables and fruits, legumes (beans, lentils, chickpeas) and cereals. Fiber provides no calories, although a portion is recovered by the action of gut bacteria on the end product, which is cellulose. They, by filling the stomach, give satiety, strengthen chewing, and literally heal the gut by facilitating intestinal transit and improving the bacterial flora. Fiber slows down and makes the absorption of carbohydrates contained in the same meal more constant so that the rise in blood sugar is more contained. In addition, fiber is proven to play a role in the prevention of many diseases including cancer. It is necessary to consume 0.5 grams of fiber per kilogram of weight daily in the early years of life, then 5 grams per day in adults. Statistics state that Italian children today eat very little fiber. This is a serious problem. Parents should enrich the table with varieties of vegetables and fruits, legumes and grains, so that they can find out which of these foods their children may like and then reintroduce them as much as possible. Fruit can also find a place at breakfast or snack time, and a serving of legumes may well replace the second plate."),
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
