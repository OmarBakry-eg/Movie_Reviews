import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'RateAndCast/rate.dart';
import 'constant.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableCode extends StatelessWidget {
  final String title;
  final Widget widget;
  final String imgUrl;
  final String overView;
  final rating;
  final id;
  final id2;
  final bool isBool;
  ReusableCode(
      {this.title,
      this.widget,
      this.imgUrl,
      this.overView,
      this.rating,
      this.id,
      this.id2,
      this.isBool});
  @override
  Widget build(BuildContext context) {
    final String over = overView;
    final rate = rating;
    final movieId = id;
    final tvId = id2;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: <Widget>[
            Container(
              width: 150.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: isBool ? Color(0xFF1D1D1D) : Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: isBool ? Color(0xFF1D1D1D) : Colors.white,
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: <Widget>[
                  ClipRRect(
                    child: GestureDetector(
                      child: Container(
                        width: 150.0,
                        height: 400.0,
                        child: CachedNetworkImage(
                          imageUrl: imgUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Rate(
                              imgUrl: imgUrl,
                              overView: over,
                              title: title,
                              rate: rate,
                              id: movieId,
                              id2: tvId,
                            );
                          }),
                        );
                      },
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320.0,
              child: Container(
                width: 150,
                height: 100,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: isBool ? Colors.white : Color(0xFF1D1D1D),
                      shadows: [
                        BoxShadow(
                          color: isBool ? Colors.white : Color(0xFF1D1D1D),
                          blurRadius: 1.0,
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCodeInWelComeScreen extends StatelessWidget {
  final String text1;
  final String text2;
  final String labelTextForEmail;
  final Function onTap;
  final Function onSubmitted;
  ReusableCodeInWelComeScreen({
    this.text1,
    this.text2,
    this.onTap,
    this.labelTextForEmail,
    this.onSubmitted,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '  $text1 💁‍♂️',
            style: signAndLoginText,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextField(
          decoration: signAndLoginDecor.copyWith(
            labelText: labelTextForEmail,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        TextField(
          obscureText: true,
          onSubmitted: onSubmitted,
          decoration: signAndLoginDecor.copyWith(
            labelText: 'Password',
            hintText: 'Enter Your Password...',
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  text2,
                  style: signAndLoginText.copyWith(
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RichTextT extends StatelessWidget {
  final String text;
  RichTextT({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Your Review\n\t\t\t\t\t\t\t\t\t\t',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                shadows: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                  ),
                ],
              ),
            ),
            TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 24.0,
                shadows: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableColumnInMoviesScreen extends StatelessWidget {
  final String text;
  final bool isBool;
  ReusableColumnInMoviesScreen({this.text, this.isBool});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                color: isBool ? Colors.white : Color(0xFF1D1D1D),
                fontWeight: FontWeight.w400,
                fontSize: 25.0,
                shadows: [
                  BoxShadow(
                    color: isBool ? Colors.white : Color(0xFF1D1D1D),
                    blurRadius: 1.0,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class ReusableCarousel extends StatelessWidget {
  final String img1;
  final String img2;
  final String img3;
  final bool isBool;
  ReusableCarousel({this.img1, this.img2, this.img3, this.isBool});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        border: borderInMovies,
      ),
      child: Card(
        color: isBool ? Colors.white : darkColor,
        elevation: 40,
        child: Stack(
          children: <Widget>[
            Carousel(
              images: [
                Image.asset(
                  img1,
                  height: 300,
                  width: 300,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  img2,
                  height: 300,
                  width: 300,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  img3,
                  height: 300,
                  width: 300,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('img/icon.png'),
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableLastContainerInMoviesAndTv extends StatelessWidget {
  final go;
  final String text;
  final bool isBool;
  ReusableLastContainerInMoviesAndTv({this.text, this.go, this.isBool});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 60.0, left: 60.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, go);
        },
        child: Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            color: isBool ? darkColor : Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border(
              top: BorderSide(
                color: isBool ? Colors.white : darkColor,
                width: 1.0,
              ),
              bottom: BorderSide(
                color: isBool ? Colors.white : darkColor,
                width: 1.0,
              ),
              right: BorderSide(
                color: isBool ? Colors.white : darkColor,
                width: 1.0,
              ),
              left: BorderSide(
                color: isBool ? Colors.white : darkColor,
                width: 1.0,
              ),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.live_tv,
                  color: isBool ? Colors.white70 : darkColor,
                  size: 40,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  text,
                  style: GoogleFonts.play(
                    color: isBool ? Colors.white70 : darkColor,
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
