import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cast extends StatefulWidget {
  static const id = 'cast_screen';
  final myApi;
  final tvApi;
  Cast({this.myApi, this.tvApi});
  @override
  _CastState createState() => _CastState();
}

class _CastState extends State<Cast> {
  bool tv = false;
  List img = [];
  List<String> names = [];
  List tvImg = [];
  List<String> tvNames = [];
  @override
  void initState() {
    super.initState();
    (widget.myApi == null)
        ? updateUITV(widget.tvApi)
        : (widget.tvApi == null) ? updateUI(widget.myApi) : print('error');
  }

  void updateUI(dynamic api) {
    for (var Value in api['cast']) {
      names.add(Value['name']);
      img.add(Value['profile_path']);
    }
    setState(() {
      tv = false;
    });
  }

  void updateUITV(dynamic api2) {
    for (var tvValue in api2['cast']) {
      tvNames.add(tvValue['name']);
      tvImg.add(tvValue['profile_path']);
    }
    setState(() {
      tv = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1D1D),
      body: GridView.builder(
        itemCount: tv ? tvNames.length : names.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 18,
        ),
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 155,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w138_and_h175_face/${tv ? tvImg[index] : img[index]}',
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    tv ? tvNames[index] : names[index],
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
