import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',                // Loads the initial screen
    routes: {
      '/': (context) => Loading(),        // Base-file is supposed to load the Loading class
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
