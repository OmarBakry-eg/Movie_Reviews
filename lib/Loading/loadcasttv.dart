import 'package:flutter/material.dart';
import '../api.dart';
import '../RateAndCast/cast.dart';

const apiKey = '61cbc96ec2d591dc03cee2a894e36719';

class LoadingCastTv extends StatefulWidget {
  static const idd = 'loadingcasttv_screen';
  final tvId;

  LoadingCastTv({
    this.tvId,
  });
  @override
  _LoadingCastTvState createState() => _LoadingCastTvState();
}

class _LoadingCastTvState extends State<LoadingCastTv> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print(getData);
  }

  void getData() async {
    ApiHelper tvDataHelper = ApiHelper(
        'https://api.themoviedb.org/3/tv/${widget.tvId}/credits?api_key=61cbc96ec2d591dc03cee2a894e36719&language=en-US');
    var tvData = await tvDataHelper.getDate();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Cast(
                tvApi: tvData,
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
            image: AssetImage('img/load4.gif'),
          ),
        ),
      ),
    );
  }
}
