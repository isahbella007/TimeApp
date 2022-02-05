// ignore_for_file: avoid_print
import 'package:worldtime/services/world_timeapi.dart';

WorldTime instance = WorldTime();

Future<String?> getTheTime() async {
  final currentTime = await instance.getUserTime();
  // print("The current time is $currentTime");
  return currentTime;
}

// Function to get day. Wheter morning or night
Future<bool?> getTheDay() async {
  final bool? theDay = await instance.getTheUserDay();
  print("Is day:  $theDay");
  
  return theDay;
}

//Get the day then return a string that is the url to the image
Future<String> urlImage() async {
  bool? result = await getTheDay();
  // getTheDay().then((theday) {
  //   print(theday);
  //   result = theday;
  //   print("Value of result inside .then.  $result");
  // });
  print("Value of result outside .then. $result");
  if (result == true) {
    print("url image result comes to true");
    return 'assets/day.png';
  } else if (result == false) {
    print("url image result comes to false");
    return 'assets/night.png';
  } else {
    print("url image result comes to null");
    return 'assets/random.jpg';
  }
}
// I think the issue rn is how to make line 23 run before everything under
// Line 28

// Funtion to get the User Location
Future<String?> getTheLocation() async {
  final userLocation = await instance.getTheUserLocastion();
  return userLocation;
}
