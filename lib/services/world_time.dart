// ignore_for_file: unused_import, avoid_print

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:convert';

class WorldTime {
  late String
  location; // Location name for the UI + late for null-safety by dart
  late String time;

  late String flag; // URL to an asset icon
  late String url; // The location url for the api endpoint
  bool isDaytime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var response = await http.get(
        Uri.parse('https://time.now/developer/api/timezone/$url'),
      );

      Map data = jsonDecode(response.body);
      //print('tessst');
      //print(response.statusCode);
      //print(data);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // CREATE A DATETIME OBJECT
      DateTime now = DateTime.parse(datetime);
      // SET THE TIME PROPERTY
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error : $e ');
      time = 'Could not get time data';
    }
  }
}
