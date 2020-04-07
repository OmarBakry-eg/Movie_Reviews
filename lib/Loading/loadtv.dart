import 'package:flutter/material.dart';
import '../api.dart';
import '../MoviesAndTv/tv.dart';

const apiKey = '61cbc96ec2d591dc03cee2a894e36719';

class Loading3 extends StatefulWidget {
  static const id = 'loading3_screen';
  @override
  _Loading3State createState() => _Loading3State();
}

class _Loading3State extends State<Loading3> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    ApiHelper popApiHelper = ApiHelper(
        'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=en-US&page=1');
    var popApi = await popApiHelper.getDate();

    ApiHelper topRatedApiHelper = ApiHelper(
        'https://api.themoviedb.org/3/tv/top_rated?api_key=$apiKey&language=en-US&page=1');
    var topApi = await topRatedApiHelper.getDate();
    ApiHelper onAirApiHelper = ApiHelper(
        'https://api.themoviedb.org/3/tv/on_the_air?api_key=$apiKey&language=en-US&page=1');
    var onAirApi = await onAirApiHelper.getDate();
    ApiHelper airTodayDateHelper = ApiHelper(
        'https://api.themoviedb.org/3/tv/airing_today?api_key=$apiKey&language=en-US&page=1');
    var todayOnAirApi = await airTodayDateHelper.getDate();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TV(
                popularApi: popApi,
                topTvApi: topApi,
                todayOnAirApi: todayOnAirApi,
                onAirTvApi: onAirApi,
              );
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F7F9),
        body: Center(
          child: Image(
            image: AssetImage('img/load3.gif'),
          ),
        ),
      ),
    );
  }
}
