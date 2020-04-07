import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/reusablecode.dart';
import 'package:movie_app/Loading/loadtv.dart';
import 'dart:io';
import 'package:movie_app/lists/list.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Movies extends StatefulWidget {
  static const id = 'movies_screen';
  final myApi;
  final myTop;
  final myUp;
  final upComing;
  Movies({this.myApi, this.myTop, this.myUp, this.upComing});
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  bool isDark = true;
  AssetsAudioPlayer _assetsAudioPlayer;
  int count;
  playMusic() {
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open("assets/music/mp2.mp3");
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
    updateUI(widget.myApi, widget.upComing, widget.myTop, widget.myUp);
  }

  void updateUI(dynamic api1, dynamic api2, dynamic api3, dynamic api4) {
    for (var titleValue in api1['results']) {
      title.add(titleValue['original_title']);
      popularId.add(titleValue['id']);
      img.add(titleValue['poster_path']);
      popularOverview.add(titleValue['overview']);
      popularRating.add(titleValue['vote_average']);
    }
    for (var Value in api2['results']) {
      upComingMoviesTitle.add(Value['original_title']);
      upComingMoviesImages.add(Value['poster_path']);
      upComingMoviesOverView.add(Value['overview']);
      upComingMoviesId.add(Value['id']);
      upComingMoviesRating.add(Value['vote_average']);
    }
    for (var topValue in api3['results']) {
      topTitle.add(topValue['original_title']);
      topId.add(topValue['id']);
      topImg.add(topValue['poster_path']);
      topRatedOverview.add(topValue['overview']);
      topRatedRating.add(topValue['vote_average']);
    }
    for (var upValue in api4['results']) {
      upTitle.add(upValue['original_title']);
      nowPlayingId.add(upValue['id']);
      upImg.add(upValue['poster_path']);
      nowPlayingOverview.add(upValue['overview']);
      nowPlayPopularRating.add(upValue['vote_average']);
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
              ),
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
              'Movie DB',
              style: welcomeReviewStyle.copyWith(fontSize: 20.0),
            ),
          ),
          backgroundColor: isDark ? Color(0xFF1D1D1D) : Colors.white,
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ReusableCarousel(
                img1: 'img/m1.jpg',
                img2: 'img/m2.jpg',
                img3: 'img/m3.jpg',
                isBool: isDark,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ReusableColumnInMoviesScreen(
                    text: 'Popular MOVIES',
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
                              title: title[index],
                              imgUrl:
                                  'https://image.tmdb.org/t/p/original/${img[index]}',
                              overView: popularOverview[index],
                              rating: popularRating[index],
                              id: popularId[index],
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
                    text: 'TopRated MOVIES',
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
                              title: topTitle[index],
                              imgUrl:
                                  'https://image.tmdb.org/t/p/original/${topImg[index]}',
                              overView: topRatedOverview[index],
                              rating: topRatedRating[index],
                              id: topId[index],
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
                    text: 'Now Playing',
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
                              title: upTitle[index],
                              imgUrl:
                                  'https://image.tmdb.org/t/p/original/${upImg[index]}',
                              overView: nowPlayingOverview[index],
                              rating: nowPlayPopularRating[index],
                              id: nowPlayingId[index],
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
              ReusableColumnInMoviesScreen(
                isBool: isDark,
                text: 'UpComming MOVIES',
              ),
              SizedBox(
                height: 20,
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
                          title: upComingMoviesTitle[index],
                          imgUrl:
                              'https://image.tmdb.org/t/p/original/${upComingMoviesImages[index]}',
                          overView: upComingMoviesOverView[index],
                          rating: upComingMoviesRating[index],
                          id: upComingMoviesId[index],
                        );
                      },
                      itemCount: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              ReusableLastContainerInMoviesAndTv(
                isBool: isDark,
                go: Loading3.id,
                text: 'Watch Tv Series',
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
