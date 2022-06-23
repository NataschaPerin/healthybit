// pagina fatta tipo griglia dove sono contenute tutte le info utili per l'utente
//
import 'package:flutter/material.dart';
import 'package:healthybit/informations/carbohydrates.dart';
import 'package:healthybit/informations/fiber.dart';
import 'package:healthybit/informations/lipid.dart';
import 'package:healthybit/informations/protein.dart';
import 'package:healthybit/informations/vitaminsminerals.dart';
import 'package:healthybit/informations/waterconsumption.dart';
import 'package:expandable_text/expandable_text.dart';

class InformationsPage extends StatelessWidget {
  InformationsPage({Key? key}) : super(key: key);

  static const route = '/Informations/';
  static const routename = 'Informationspage';
  static const BSplate = "assets/BSplate.jpg";
  final borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    print('${InformationsPage.routename} built');
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.all(8), // Border width
          width: 550,
          height: 350,
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: borderRadius),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.asset(BSplate, fit: BoxFit.fill),
            ),
          ),
        ),
        ListTile(
          title: Text(
            'The Balanced Plate',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('General directions on how to compose your dish'),
        ),
        ListTile(
          title: ExpandableText(
            "Not everything changes in medicine. Some concepts remain steadfast for millennia. Today's physicians repeat what the followers of Hippocrates were already saying 3,000 years ago. Health also depends on what you eat, and a proper diet certainly contributes to its maintenance. A controlled and therefore healthy, moderate and balanced diet is important for everyone. In part, the suggestions on this page are an opportunity for improvement. Nutrition is one of the pillars of health, on a par with exercise, self-control and therapeutic education. Pursuing health at the table means making choices that are against the grain and often far removed from advertising hype. At the end of the day, however, it is about learning to rediscover true and natural flavors without covering them up with excess fat, salt or artificial additions, not to overdo portions and to put a little bit of everything on the table",
            expandText: 'show more',
            collapseText: 'show less',
            maxLines: 3,
            linkColor: Colors.blue,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 28),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.transparent,
                child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: InkWell(
                      child: new Center(
                        child: new Text(
                          "Proteins",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      onDoubleTap: () =>
                          Navigator.of(context).push(_goProtein()),
                    )),
              ),
            ),
            SizedBox(width: 2),
            Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: Color.fromARGB(255, 208, 196, 29),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: InkWell(
                          child: new Center(
                            child: new Text(
                              "Carbohydrates",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          onDoubleTap: () =>
                              Navigator.of(context).push(_goCarbo()),
                        )))),
            SizedBox(width: 5),
            Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: InkWell(
                          child: new Center(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  new Text(
                                    "Vitamins",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text("and",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      )),
                                  Text("Minerals",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          onDoubleTap: () =>
                              Navigator.of(context).push(_goVM()),
                        )))),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 28),
            Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: Color.fromARGB(255, 50, 123, 53),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: InkWell(
                              child: new Center(
                                child: new Text(
                                  "Fibers",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              onDoubleTap: () =>
                                  Navigator.of(context).push(_goFibers()),
                            ))))),
            SizedBox(width: 2),
            Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: Color.fromARGB(255, 205, 126, 7),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: InkWell(
                              child: new Center(
                                child: new Text(
                                  "Lipids",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              onDoubleTap: () =>
                                  Navigator.of(context).push(_goLipids()),
                            ))))),
            SizedBox(width: 2),
            Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: Colors.purple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: InkWell(
                              child: new Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 30),
                                    new Text(
                                      "Water",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    new Text(
                                      "Consumption",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onDoubleTap: () =>
                                  Navigator.of(context).push(_goWC()),
                            ))))),
          ],
        )
      ],
    )));
  }
}

Route _goProtein() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ProteinPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _goCarbo() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const CarbohydratesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _goVM() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const VMPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _goFibers() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const FiberPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _goLipids() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LipidPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _goWC() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const WaterPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
 //HomePage 