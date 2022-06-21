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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildCard(1,
                          'https://www.google.com/imgres?imgurl=https%3A%2F%2Ftoppng.com%2Fuploads%2Fpreview%2Fegg-png-11553982163adxg943uq9.png&imgrefurl=https%3A%2F%2Ftoppng.com%2Ffree-image%2Fegg-png-PNG-free-PNG-Images_136924&tbnid=BUWcfevZJHRXlM&vet=12ahUKEwi12sy33774AhXKhP0HHWg-BcIQMygCegUIARDMAQ..i&docid=3l3aYoQZ7mpvTM&w=840&h=859&q=egg%20images%20png&ved=2ahUKEwi12sy33774AhXKhP0HHWg-BcIQMygCegUIARDMAQ'),
                      const SizedBox(width: 12),
                      _buildCard(1,
                          'https://www.google.com/imgres?imgurl=https%3A%2F%2Ftoppng.com%2Fuploads%2Fpreview%2Fegg-png-11553982163adxg943uq9.png&imgrefurl=https%3A%2F%2Ftoppng.com%2Ffree-image%2Fegg-png-PNG-free-PNG-Images_136924&tbnid=BUWcfevZJHRXlM&vet=12ahUKEwi12sy33774AhXKhP0HHWg-BcIQMygCegUIARDMAQ..i&docid=3l3aYoQZ7mpvTM&w=840&h=859&q=egg%20images%20png&ved=2ahUKEwi12sy33774AhXKhP0HHWg-BcIQMygCegUIARDMAQ'),
                      const SizedBox(width: 12),
                      _buildCard(1,
                          'https://www.google.com/imgres?imgurl=https%3A%2F%2Ftoppng.com%2Fuploads%2Fpreview%2Fegg-png-11553982163adxg943uq9.png&imgrefurl=https%3A%2F%2Ftoppng.com%2Ffree-image%2Fegg-png-PNG-free-PNG-Images_136924&tbnid=BUWcfevZJHRXlM&vet=12ahUKEwi12sy33774AhXKhP0HHWg-BcIQMygCegUIARDMAQ..i&docid=3l3aYoQZ7mpvTM&w=840&h=859&q=egg%20images%20png&ved=2ahUKEwi12sy33774AhXKhP0HHWg-BcIQMygCegUIARDMAQ'),
                      const SizedBox(width: 12),
                      _buildCard(1,
                          'https://www.google.com/imgres?imgurl=https%3A%2F%2Ftoppng.com%2Fuploads%2Fpreview%2Fegg-png-11553982163adxg943uq9.png&imgrefurl=https%3A%2F%2Ftoppng.com%2Ffree-image%2Fegg-png-PNG-free-PNG-Images_136924&tbnid=BUWcfevZJHRXlM&vet=12ahUKEwi12sy33774AhXKhP0HHWg-BcIQMygCegUIARDMAQ..i&docid=3l3aYoQZ7mpvTM&w=840&h=859&q=egg%20images%20png&ved=2ahUKEwi12sy33774AhXKhP0HHWg-BcIQMygCegUIARDMAQ'),
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
                child: Text("My demo styling"),
              ),
            ),
          ]),
        ));
  }

  Widget _buildCard(int index, String url) => Container(
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
            child: Image(
              image: NetworkImage(url),
            )),
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
