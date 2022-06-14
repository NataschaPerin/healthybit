import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/homepage.dart';
import 'package:healthybit/utils/strings.dart';

class Fitbit extends StatelessWidget {
  Fitbit({Key? key}) : super(key: key);

  static const route = '/fitbit/';
  static const routename = 'Fitbit';

  @override
  Widget build(BuildContext context) {
    print('${Fitbit.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(Fitbit.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Authorize the app
                String? userId = await FitbitConnector.authorize(
                    context: context,
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    redirectUri: Strings.fitbitRedirectUri,
                    callbackUrlScheme: Strings.fitbitCallbackScheme);
                Navigator.pushNamed(context, HomePage.route);
              },
              child: Text('Tap to authorize'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FitbitConnector.unauthorize(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                );
              },
              child: Text('Tap to unauthorize'),
            ),
            //ElevatedButton(
            //onPressed: () => _toHomePage(context), child: Text('to home'))
          ],
        ),
      ),
    );
  } //build

  void _toHomePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(HomePage.route);
  } //_toHomePage
} //HomePage