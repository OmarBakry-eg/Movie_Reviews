import 'package:flutter/material.dart';
import '../api.dart';
import '../RateAndCast/cast.dart';

const apiKey = '61cbc96ec2d591dc03cee2a894e36719';

class Loading2 extends StatefulWidget {
  static const idd = 'loading2_screen';
  final moviesId;
  Loading2({this.moviesId});
  @override
  _Loading2State createState() => _Loading2State();
}

class _Loading2State extends State<Loading2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    ApiHelper apiHelper = ApiHelper(
        'https://api.themoviedb.org/3/movie/${widget.moviesId}/credits?api_key=$apiKey');
    var apiData = await apiHelper.getDate();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Cast(
                myApi: apiData,
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
            image: AssetImage('img/load1.gif'),
          ),
        ),
      ),
    );
  }
}
