// ignore_for_file: avoid_print, duplicate_ignore
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as world_time_api;

class WorldTime {
  String? contient;
  String? url;
  String? time;
  String? location;
  late bool isDay;

  // Function to get the User's time:
  Future<String?> getUserTime() async {
    try {
      final userTimeResponse =
          await world_time_api.get(Uri.parse("http://worldtimeapi.org/api/ip"));
      Map data = jsonDecode(userTimeResponse.body);
      // print(data['datetime']);

      // Get the datetime from the api, and the offset (GMT)
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      // print(offset);

      // Parse the datetime and add the offset
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now.hour);

      // Get the Time.
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'Could not be found';
    }
    return time;
  }

  // Function to get if it is day or night
  Future<bool> getTheUserDay() async {
    try {
      final userDayResponse =
          await world_time_api.get(Uri.parse("http://worldtimeapi.org/api/ip"));
      Map data = jsonDecode(userDayResponse.body);

      // Get the datetime from the api, and the offset (GMT)
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Get the day. Whether morning or night
      if (now.hour > 6 && now.hour < 18) {
        isDay = true;
        print("getTheUserDay func -- reaches here: The day is $isDay");
      } else {
        isDay = false;
        print("getTheUserDay func -- reaches here: The day is $isDay");
      }
      
    } catch (e) {
      print('caught error: $e');
    }
    return isDay;
  }

  // Function to get the user Location
  Future<String?> getTheUserLocastion() async {
    try {
      final userLocationResponse =
          await world_time_api.get(Uri.parse("http://worldtimeapi.org/api/ip"));
      Map data = jsonDecode(userLocationResponse.body);

      // Get the Location
      String rawLocation = data["timezone"];
      location = rawLocation.split('/')[1];
    } catch (e) {
      print("Location not found");
    }
    return location;
  }
}
