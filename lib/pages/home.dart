import 'package:flutter/material.dart';
import 'package:worldtime/controller/HomeController/home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<String?> theTime = getTheTime();
  final Future<String?> theLocation = getTheLocation();
  late String theDay; 

  @override
  void initState(){
    theDay = urlImage();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue[400],
          body: SafeArea(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(theDay),
              fit: BoxFit.cover,
            )),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                const SizedBox(height: 270.0),
                Column(
                  children: <Widget>[
                    FutureBuilder(
                        future: Future.wait([theLocation, theTime]),
                        builder: (context, AsyncSnapshot<List> snapshot) {
                          if (snapshot.hasData) {
                            final data = snapshot.data![0];
                            final dataTwo = snapshot.data![1];

                            String dataToString = data.toString();
                            String dataToStringTwo = dataTwo.toString();

                            return Column(
                              children: [
                                Text(
                                  dataToString,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Text(
                                  dataToStringTwo,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Text("Data could not be fetched");
                          }
                        }),
                  ],
                ),
              ],
            ),
          ))),
    );
  }
}
