import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constant.dart';
import '../Loading/loadcastmovies.dart';
import '../Loading/loadcasttv.dart';
import 'dart:math';
import '../reusablecode.dart';

class Rate extends StatefulWidget {
  static const idd = 'rate_screen';
  final String imgUrl;
  final String overView;
  final String title;
  final rate;
  final id;
  final id2;
  Rate({this.imgUrl, this.overView, this.title, this.rate, this.id, this.id2});
  @override
  _RateState createState() =>
      _RateState(imgUrl: imgUrl, overView: overView, title: title, rate: rate);
}

class _RateState extends State<Rate> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final String imgUrl;
  final String overView;
  final String title;
  final rate;
  var review;
  int count;
  TextEditingController _controller = TextEditingController();

  _RateState({this.imgUrl, this.overView, this.title, this.rate});

  SnackBar snackBar = SnackBar(
    content: Text(
      'Your Review has been added to MovieDB !',
      style: TextStyle(color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    print(widget.id2);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height - 20) * 0.6,
                decoration: rateImageBoxDecor,
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: rateRadiusImage,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 33.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RatingBar(
                initialRating: Random().nextInt(5) + 3.toDouble(),
                direction: Axis.horizontal,
                itemSize: 35,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    overView,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              Wrap(
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                    ),
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: imgUrl,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: rateRadiusImage,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      right: 15.0,
                      left: 6.0,
                      bottom: 43.0,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'IMDB Review\n\t\t\t\t\t\t\t\t\t\t',
                            style: imbdReviewStyle,
                          ),
                          TextSpan(
                            text: rate.toString(),
                            style: rateTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: Container(
                      width: 150,
                      height: 50,
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          setState(() {
                            review = value;
                            print(review);
                            count = 1;
                          });
                          _scaffoldKey.currentState.showSnackBar(snackBar);
                        },
                        decoration: signAndLoginDecor.copyWith(
                          labelText: "Your Review",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                          hintText: 'Review',
                        ),
                      ),
                    ),
                    secondChild: RichTextT(
                      text: review.toString(),
                    ),
                    crossFadeState: (count == null)
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(
                      milliseconds: 500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.0, bottom: 20.0),
                child: GestureDetector(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Show The Cast',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    (widget.id2 == null)
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loading2(
                                moviesId: widget.id,
                              ),
                            ),
                          )
                        : (widget.id == null)
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoadingCastTv(
                                    tvId: widget.id2,
                                  ),
                                ),
                              )
                            : print('error');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
