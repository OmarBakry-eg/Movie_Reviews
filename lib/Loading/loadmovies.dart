import 'package:flutter/material.dart';
import '../api.dart';
import '../MoviesAndTv//movies.dart';

const apiKey = '61cbc96ec2d591dc03cee2a894e36719';

class HomePage extends StatefulWidget {
  static const id = 'loading1_screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    ApiHelper apiHelper = ApiHelper(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1');
    var apiData = await apiHelper.getDate();

    ApiHelper upComingHelper = ApiHelper(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=2');
    var upComing = await upComingHelper.getDate();
    ApiHelper topDataHelper = ApiHelper(
        'http://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=4');
    var topData = await topDataHelper.getDate();
    ApiHelper upComingDateHelper = ApiHelper(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=2');
    var upComingData = await upComingDateHelper.getDate();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Movies(
                myApi: apiData,
                myTop: topData,
                myUp: upComingData,
                upComing: upComing,
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
            image: AssetImage('img/load.gif'),
          ),
        ),
      ),
    );
  }
}
//
