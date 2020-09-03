import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ip_geolocation_api/ip_geolocation_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';
  GeolocationData geolocationData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getIp();
  }

  Future<void> getIp() async {
    geolocationData = await GeolocationAPI.getData();

    if (geolocationData != null) {
      setState(() {
        text = geolocationData.ip;
      });
    }

    print("my Ip: ${geolocationData.ip}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("my ip: $text"),
        FlatButton(
            color: Colors.amber,
            onPressed: () {
              if (geolocationData != null) {
                setState(() {
                  text = jsonEncode(geolocationData.toJson());
                });
              }
            },
            child: Text("To JSON"))
      ],
    ))));
  }
}
