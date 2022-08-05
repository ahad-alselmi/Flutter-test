import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_app/place_detailes.dart';
import 'place_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  PlaceDetailes detailes=PlaceDetailes ();
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body:SafeArea(child: PlacePage(detailes.fillData())),


      ),

    );
  }
}



