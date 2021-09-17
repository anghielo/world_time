import 'package:http/http.dart';
import 'dart:convert';          // Allows to convert JSON string into data to work with
import 'package:intl/intl.dart';

class WorldTime {

  late String location;   // Location name for the UI
  late String time;       // The time in that location
  late String flag;       // URL to asset flag icon
  late String url;        // This is the location url for api endpoint
  late bool isDayTime;    // Will show if daytime is true or false

  // Constructor
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      // Set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);   // Done by importing intl package
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
