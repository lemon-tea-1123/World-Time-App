// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    // SET BACKGROUND
    String bgImage = data['isDaytime'] ? 'daytime.jpeg' : 'nighttime.jpeg';
    Color bgColor = data['isDaytime'] ? Color(0xFFaab6c4) : Color(0xFF214d70);
    Color textCol = data['isDaytime']
        ? Color.fromARGB(255, 0, 27, 49)
        : Color(0xFFF0F8FF);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      '/location',
                    );
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location, color: textCol),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: textCol),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 3.0,
                        fontFamily: 'Bileha',
                        fontWeight: FontWeight.bold,
                        color: textCol,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    fontFamily: 'Crimson',
                    color: textCol,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
