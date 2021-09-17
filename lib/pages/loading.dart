import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getData() async {      // Action that starts now and finishes in the future
  //   // // Simulate a network request for a username
  //   // String username = await Future.delayed(Duration(seconds: 3), () {     // Wait until this is done to start the next line
  //   //   return 'yoshi';
  //   // });
  //   //
  //   // // Simulate a network request to get bio of the username
  //   // String bio = await Future.delayed(Duration(seconds: 2), () {
  //   //   return 'vega, musician & egg collector';
  //   // });
  //   //
  //   // print('$username - $bio');
  //
  //   Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //   // print(response.body);
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  // }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    print('initState function ran');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
