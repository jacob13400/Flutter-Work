import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // Location name for UI
  String time; // Time in given location
  String flag; //url to an asset flag icon
  String url; //Location url for API endpoint 
  bool isDaytime; // true is daytime

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {

    try {

      // Make request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print("Caught error: $e");
      time = "Could not get time data";
    }

  }

}