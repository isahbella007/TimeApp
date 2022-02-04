// ignore_for_file: avoid_print

import 'package:worldtime/services/world_timeapi.dart';

WorldTime instance = WorldTime();

Future<String?> getTheTime() async {
  final currentTime = await instance.getUserTime();
  // print("The current time is $currentTime");
  return currentTime;
}

// Function to get day. Wheter morning or night
Future<bool?> getTheDay() async{
  final bool? theDay =  await instance.getTheUserDay();
  print("The day is $theDay");
  return theDay;
}

//Get the day then return a string that is the url to the image
String urlImage() {
  bool? result;
  getTheDay().then((theday) {
    print(theday);
    result = theday;
    print("Value of result inside .then. Night time currently $result");
  });
  print("Value of result outside .then. Night time currentlty $result");
  if (result == true) {
    return 'assets/day.png';
  } else {
    return 'assets/night.png';
  }
}
// I think the issue rn is how to make line 23 run before everything under 
// Line 28


// Funtion to get the User Location
Future<String?> getTheLocation() async {
  final userLocation = await instance.getTheUserLocastion();
  return userLocation;
}
