import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var darkColor = Color(0xFF1D1D1D);
var ownReviewStyle = GoogleFonts.quicksand(
  color: Colors.white,
  fontWeight: FontWeight.w100,
  fontSize: 18.0,
  shadows: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 8.0,
      spreadRadius: 8.0,
    )
  ],
);

var welcomeReviewStyle = GoogleFonts.orbitron(
  color: Colors.white,
  fontSize: 28.0,
  fontWeight: FontWeight.w400,
  shadows: [
    BoxShadow(
      color: Colors.white,
      blurRadius: 1.0,
      spreadRadius: 1.0,
    ),
    BoxShadow(
      color: Colors.black,
      blurRadius: 8.0,
      spreadRadius: 8.0,
    ),
  ],
);

var signAndLoginDecor = InputDecoration(
  labelText: 'E-mail',
  labelStyle: ownReviewStyle.copyWith(
    fontSize: 15.0,
    fontStyle: FontStyle.italic,
  ),
  hintText: 'Type Your email...',
  hintStyle: ownReviewStyle.copyWith(
    color: Colors.white54,
  ),
  filled: true,
  fillColor: Colors.white24,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  ),
);

var signAndLoginText = GoogleFonts.pacifico(
  fontSize: 20.0,
  fontWeight: FontWeight.w300,
  color: Colors.white,
  shadows: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 8.0,
      spreadRadius: 8.0,
    )
  ],
);

var borderInMovies = Border(
  top: BorderSide(
    color: Color(0xFF323232),
    width: 0.5,
  ),
  bottom: BorderSide(
    color: Color(0xFF323232),
    width: 0.5,
  ),
  right: BorderSide(
    color: Color(0xFF323232),
    width: 0.5,
  ),
  left: BorderSide(
    color: Color(0xFF323232),
    width: 0.5,
  ),
);

var rateImageBoxDecor = BoxDecoration(
  color: Colors.orange,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(45.0),
    topRight: Radius.circular(45.0),
    bottomRight: Radius.circular(45.0),
    bottomLeft: Radius.circular(45.0),
  ),
);

var rateRadiusImage = BorderRadius.only(
  bottomRight: Radius.circular(45.0),
  bottomLeft: Radius.circular(45.0),
);

var imbdReviewStyle = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
  shadows: [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 1.0,
    ),
  ],
);

var rateTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w300,
  fontSize: 24.0,
  shadows: [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 4.0,
    ),
  ],
);
