// ignore_for_file: strict_top_level_inference, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      location: 'Algiers',
      flag: 'algeriaflag.webp',
      url: 'Africa/Algiers',
    ),
    WorldTime(location: 'Gaza', flag: 'palestine.png', url: 'Asia/Gaza'),
    WorldTime(
      location: 'Casablanca',
      flag: 'morrocoflag.png',
      url: 'Africa/Casablanca',
    ),
    WorldTime(location: 'Tunis', flag: 'tunisiaflag.webp', url: 'Africa/Tunis'),
    WorldTime(location: 'Muscat', flag: 'oman.png', url: 'Asia/Muscat'),
    WorldTime(location: 'Riyadh', flag: 'saudiarabia.png', url: 'Asia/Riyadh'),
    WorldTime(location: 'Moscow', flag: 'russiaflag.png', url: 'Europe/Moscow'),
    WorldTime(location: 'Madrid', flag: 'spainflag.png', url: 'Europe/Madrid'),
    WorldTime(
      location: 'Pyongyang',
      flag: 'northkoreaflag.png',
      url: 'Asia/Pyongyang',
    ),
    WorldTime(location: 'Bern', flag: 'swissflag.webp', url: 'Europe/Zurich'),
    WorldTime(location: 'London', flag: 'ukflag.webp', url: 'Europe/London'),
    WorldTime(location: 'NewYork', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Rome', flag: 'italyflag.webp', url: 'Europe/Rome'),
    WorldTime(location: 'Amman', flag: 'jordan.png', url: 'Asia/Amman'),
    WorldTime(location: 'Tokyo', flag: 'japanflag.png', url: 'Asia/Tokyo'),
  ];
  void updateTime(index) async {
    WorldTime instantvar = locations[index];
    await instantvar.getTime();
    // Navigate to home screen
    Navigator.pop(context, {
      'location': instantvar.location,
      'flag': instantvar.flag,
      'time': instantvar.time,
      'isDaytime': instantvar.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  //print(locations[index].location);
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${locations[index].flag}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
