import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // Location url for API endpoint
  bool isDayTime=true; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url})
      : time = '';

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      //print(datetime);
      //print(offset);
      bool isPositive = offset[0] == '+' ? true : false;
      offset = offset.substring(1);
      List<String> offsetList = offset.split(':');
      int hours = int.parse(offsetList[0]);
      int minutes = int.parse(offsetList[1]);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      if (isPositive)
        now = now.add(Duration(hours: hours, minutes: minutes));
      else
        now = now.subtract(Duration(hours: hours, minutes: minutes));
      // set the time property
      isDayTime = now.hour > 6 && now.hour <= 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}
