import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VMPage extends StatefulWidget {
  const VMPage({Key? key}) : super(key: key);

  static const route = '/VMPage/';
  static const routename = 'VMPage';

  @override
  State<VMPage> createState() => VMPageState();
}

class VMPageState extends State<VMPage> {
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
                      _buildCard('assets/arance.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/spinaci.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/cereali.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/mele.jpg'),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildTitle('VITAMINS AND MINERALS', Colors.black),
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
                    "Vitamins and minerals are micronutrients required by the body to carry out a range of normal functions. However, these micronutrients are not produced in our bodies and must be derived from the food we eat. Vitamins are organic substances that are generally classified as either fat soluble or water soluble. Fat-soluble vitamins (vitamin A, vitamin D, vitamin E, and vitamin K) dissolve in fat and tend to accumulate in the body. Water-soluble vitamins (vitamin C and the B-complex vitamins, such as vitamin B6, vitamin B12, and folate) must dissolve in water before they can be absorbed by the body, and therefore cannot be stored. Any water-soluble vitamins unused by the body is primarily lost through urine. Minerals are inorganic elements present in soil and water, which are absorbed by plants or consumed by animals. While you’re likely familiar with calcium, sodium, and potassium, there is a range of other minerals, including trace minerals (e.g. copper, iodine, and zinc) needed in very small amounts."),
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
