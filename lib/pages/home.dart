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
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDayTime'] == 'Day'
        ? 'lib/assets/day.jpg'
        : 'lib/assets/night.jpg';
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('$bgImage'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
                child: Column(
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location',
                                arguments: data,);
                        if (result != null) {
                          setState(() {
                            data = {
                              'Location': result['location'],
                              'Flag': result['flag'],
                              'Time': result['time'],
                              'isDayTime': result['isDayTime']
                            };
                          });
                        }
                      },
                      icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                      label: Text('Edit Location',
                          style: TextStyle(color: Colors.grey[300])),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['Location'],
                          style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['Time'],
                      style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
