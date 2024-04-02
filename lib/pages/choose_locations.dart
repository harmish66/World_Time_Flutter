import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'London, United Kingdom',
        flag: 'uk.png',
        url: 'Europe/London'),
    WorldTime(
        location: 'Berlin, Germany', 
        flag: 'germany.png', 
        url: 'Europe/Berlin'),
    WorldTime(
      location: 'Cairo, Egypt',
      flag: 'egypt.png',
      url: 'Africa/Cairo'),
    WorldTime(
        location: 'Toronto, Canada',
        flag: 'canada.png',
        url: 'America/Toronto'),
    WorldTime(
        location: 'Kolkata, India',
        flag: 'india.png',
        url: 'Asia/Kolkata'),
    WorldTime(
        location: 'New York, United States',
        flag: 'usa.png',
        url: 'America/New_York'),
    WorldTime(
        location: 'Seoul, South Korea',
        flag: 'south_korea.png',
        url: 'Asia/Seoul'),
    WorldTime(
      location: 'Tokyo, Japan', 
      flag: 'japan.png', 
      url: 'Asia/Tokyo'),
  ];

  
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    locations.sort((a, b) => a.flag.compareTo(b.flag));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: 
          ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                color: Colors.lightBlue,
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('lib/assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
