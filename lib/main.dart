import 'package:flutter/material.dart';
import 'sign/hello.dart';
import 'Loading/loadmovies.dart';
import 'RateAndCast/rate.dart';
import 'MoviesAndTv/movies.dart';
import 'Loading/loadcastmovies.dart';
import 'RateAndCast/cast.dart';
import 'MoviesAndTv/tv.dart';
import 'Loading/loadtv.dart';
import 'Loading/loadcasttv.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Hello(),
      routes: {
        Hello.id: (context) => Hello(),
        HomePage.id: (context) => HomePage(),
        Movies.id: (context) => Movies(),
        Rate.idd: (context) => Rate(),
        Loading2.idd: (context) => Loading2(),
        Cast.id: (context) => Cast(),
        Loading3.id: (context) => Loading3(),
        TV.id: (context) => TV(),
        LoadingCastTv.idd: (context) => LoadingCastTv(),
      },
    );
  }
}
