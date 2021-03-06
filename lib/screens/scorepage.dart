import 'package:flutter/material.dart';
import 'package:healthybit/screens/fitnessactivity.dart';
import 'package:healthybit/screens/progressPage.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';
import 'package:healthybit/database/entities/food.dart';
import 'package:healthybit/repositories/databaseRepository.dart';
import 'package:healthybit/widgets/formTiles.dart';
import 'package:healthybit/widgets/formSeparator.dart';
import 'package:healthybit/utils/formats.dart';
import 'package:provider/provider.dart';
import 'package:healthybit/screens/Results.dart';

class ScorePage extends StatelessWidget {
  final double bmiScore;

  final int age;

  final int weight;

  final int height;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  ScorePage(
      {Key? key,
      required this.bmiScore,
      required this.age,
      required this.weight,
      required this.height})
      : super(key: key);

  static const route = '/ScorePage';
  static const routeDisplayName = 'Score page';

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Score"),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Score",
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('UnderWeight', 18.5, Colors.red),
                        GaugeSegment('Normal', 6.4, Colors.green),
                        GaugeSegment('OverWeight', 5, Colors.orange),
                        GaugeSegment('Obese', 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: bmiScore.toDouble(),
                      needleColor: Colors.blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(fontSize: 20, color: bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Re-calculate")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Share.share(
                                  "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                            },
                            child: const Text("Share")),
                      ],
                    ),
                    FloatingActionButton(
                        child: const Icon(Icons.save_alt),
                        onPressed: () => Navigator.pushNamed(context,
                            ProgressPage.route) //_toResultsPage(context, null),
                        ),
                  ]))),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }

  void _toResultsPage(BuildContext context, Parameter? parameter) {
    Navigator.pushNamed(context, ResultsPage.route,
        arguments: {'parameter': Parameter});
    //Navigator.of(context)
    //.pushNamed(ResultsPage.route, arguments: {'parameter': Parameter});
  } //_toResultsPage
}
