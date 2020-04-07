import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../Loading/loadmovies.dart';
import '../reusablecode.dart';
import 'dart:io';
import 'package:movie_app/lists/list.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class TV extends StatefulWidget {
  static const id = 'tv_screen';
  final popularApi;
  final topTvApi;
  final onAirTvApi;
  final todayOnAirApi;
  TV({this.popularApi, this.topTvApi, this.onAirTvApi, this.todayOnAirApi});
  @override
  _TVState createState() => _TVState();
}

class _TVState extends State<TV> {
  bool isDark = true;
  AssetsAudioPlayer _assetsAudioPlayer;
  int count;
  playMusic() {
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open("assets/music/mp1.mp3");
    _assetsAudioPlayer.play();
    _assetsAudioPlayer.toggleLoop();
    setState(() {
      count = 1;
    });
  }

  stopMusic() {
    _assetsAudioPlayer.playOrPause();
    setState(() {
      count = 2;
    });
  }

  Future<bool> _onClicking() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Do you really want to exit the app?'),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () => exit(0),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('No'),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    playMusic();
    updateUI(
      widget.popularApi,
      widget.topTvApi,
      widget.todayOnAirApi,
      widget.onAirTvApi,
    );
  }

  void updateUI(dynamic api1, dynamic api2, dynamic api3, dynamic api4) {
    for (var popValue in api1['results']) {
      popularTitleTV.add(popValue['original_name']);
      popularIdTV.add(popValue['id']);
      popularImagesTV.add(popValue['poster_path']);
      popularOverViewTV.add(popValue['overview']);
      popularRatingTv.add(popValue['vote_average']);
    }
    for (var topValue in api2['results']) {
      topRatedTitleTV.add(topValue['original_name']);
      topRatedIdTV.add(topValue['id']);
      topRatedImagesTV.add(topValue['poster_path']);
      topRatedOverViewTV.add(topValue['overview']);
      topRatedRatingTv.add(topValue['vote_average']);
    }
    for (var todayOnAirValue in api3['results']) {
      todayOnAirTitleTV.add(todayOnAirValue['original_name']);
      todayOnAirIdTV.add(todayOnAirValue['id']);
      todayOnAirImagesTV.add(todayOnAirValue['poster_path']);
      todayOnAirOverViewTV.add(todayOnAirValue['overview']);
      todayOnAirRatingTv.add(todayOnAirValue['vote_average']);
    }

    for (var onAirValue in api4['results']) {
      onAirTitleTV.add(onAirValue['original_name']);
      onAirIdTV.add(onAirValue['id']);
      onAirImagesTV.add(onAirValue['poster_path']);
      onAirOverViewTV.add(onAirValue['overview']);
      onAirRatingTv.add(onAirValue['vote_average']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onClicking,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 30,
            backgroundColor: Color(0xFF1D1D1D),
            actions: <Widget>[
              CupertinoSwitch(
                value: isDark ? true : false,
                onChanged: (val) {
                  setState(() {
                    isDark = !isDark;
                  });
                },
              )
            ],
            leading: AnimatedCrossFade(
              firstChild: IconButton(
                icon: Icon(
                  Icons.stop,
                  color: Colors.red,
                ),
                onPressed: stopMusic,
              ),
              secondChild: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.greenAccent,
                ),
                onPressed: playMusic,
              ),
              crossFadeState: (count == 1)
                  ? CrossFadeState.showFirst
                  : (count == 2) ? CrossFadeState.showSecond : null,
              duration: Duration(
                milliseconds: 80,
              ),
            ),
            centerTitle: true,
            title: Text(
              'Television DB',
              style: welcomeReviewStyle.copyWith(fontSize: 20.0),
            ),
          ),
          backgroundColor: isDark ? Color(0xFF1D1D1D) : Colors.white,
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ReusableCarousel(
                isBool: isDark,
                img1: 'img/t1.jpg',
                img2: 'img/t2.jpg',
                img3: 'img/t3.jpg',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ReusableColumnInMoviesScreen(
                    isBool: isDark,
                    text: 'Popular TvShow',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 430.0,
                        color: isDark ? Color(0xFF1D1D1D) : Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ReusableCode(
                              isBool: isDark,
                              title: popularTitleTV[index],
                              imgUrl:
                                  'https://image.tmdb.org/t/p/original/${popularImagesTV[index]}',
                              overView: popularOverViewTV[index],
                              rating: popularRatingTv[index],
                              id2: popularIdTV[index],
                            );
                          },
                          itemCount: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ReusableColumnInMoviesScreen(
                    isBool: isDark,
                    text: 'TopRated TvShow',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 430.0,
                        color: isDark ? Color(0xFF1D1D1D) : Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ReusableCode(
                              isBool: isDark,
                              title: topRatedTitleTV[index],
                              imgUrl:
                                  'https://image.tmdb.org/t/p/original/${topRatedImagesTV[index]}',
                              overView: topRatedOverViewTV[index],
                              rating: topRatedRatingTv[index],
                              id2: topRatedIdTV[index],
                            );
                          },
                          itemCount: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ReusableColumnInMoviesScreen(
                    isBool: isDark,
                    text: 'OnAir Now',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 430.0,
                        color: isDark ? Color(0xFF1D1D1D) : Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ReusableCode(
                              isBool: isDark,
                              title: onAirTitleTV[index],
                              imgUrl:
                                  'https://image.tmdb.org/t/p/original/${onAirImagesTV[index]}',
                              overView: onAirOverViewTV[index],
                              rating: onAirRatingTv[index],
                              id2: onAirIdTV[index],
                            );
                          },
                          itemCount: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ReusableColumnInMoviesScreen(
                    text: 'Today OnAir',
                    isBool: isDark,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 430.0,
                        color: isDark ? Color(0xFF1D1D1D) : Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ReusableCode(
                              isBool: isDark,
                              title: todayOnAirTitleTV[index],
                              imgUrl:
                                  'https://image.tmdb.org/t/p/original/${todayOnAirImagesTV[index]}',
                              overView: todayOnAirOverViewTV[index],
                              rating: todayOnAirRatingTv[index],
                              id2: todayOnAirIdTV[index],
                            );
                          },
                          itemCount: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              ReusableLastContainerInMoviesAndTv(
                isBool: isDark,
                go: HomePage.id,
                text: 'Watch Movies',
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
