import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'Location': instance.location,
        'Flag': instance.flag,
        'Time': instance.time,
        'isDayTime': instance.isDayTime ? 'Day' : 'Night',
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.blue,
          size: 80.0,
        ),
      ),
    );
  }
}
