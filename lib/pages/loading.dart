import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading";
  void setupWorldTime () async {
    WorldTime instance = WorldTime(location: 'Phonm Penh', flag: 'germany.png', url: 'Asia/Phnom_Penh');
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
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey[800],
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 50.0,
        ),
    )
    );
  }
}
