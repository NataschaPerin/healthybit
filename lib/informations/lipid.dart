import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LipidPage extends StatefulWidget {
  const LipidPage({Key? key}) : super(key: key);

  static const route = '/LipidPage/';
  static const routename = 'LipidPage';

  @override
  State<LipidPage> createState() => _LipidPageState();
}

class _LipidPageState extends State<LipidPage> {
  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 182, 142),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      _buildCard('assets/burro.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/avocado.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/olio.jpg'),
                      const SizedBox(width: 12),
                      _buildCard('assets/noci.jpg'),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildTitle('LIPIDS', Colors.black),
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
                    border: Border.all(
                        color: Color.fromARGB(255, 205, 126, 7), width: 5.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ]),
                child: Text(
                    "In childhood, after the third year of life, and are to adolescence, 30 percent of daily intake should be provided by fats. The same is true for the adult who is physically active, while in the sedentary individual it should drop to 25%. In addition to quantity, it is necessary to take care of the quality of fats and thus choose the right ones: 1-Monounsaturated fats of mainly vegetable origin, and of which olive oil is particularly rich, should provide up to 20% of total calories; 2- Saturated fats (of mainly animal origin) should not exceed 7-10% of total calories; 3-Polyunsaturated fats provided mainly by seed oils, provide about 7% of total calories and provide two categories of good fats: Omega 3, found in 'fatty' fish (such as tuna) of which we should consume 0. 7-1.5 g per day and Omega 6 (requirement 4-6 g per day) found in seeds and nuts."),
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
            border:
                Border.all(color: Color.fromARGB(255, 205, 126, 7), width: 5.0),
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
