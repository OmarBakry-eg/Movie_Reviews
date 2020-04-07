import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Loading/loadmovies.dart';
import '../Loading/loadtv.dart';
import '../constant.dart';
import '../reusablecode.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Hello extends StatefulWidget {
  static const id = 'welcome_screen';
  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  int counter = 1;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                child: Opacity(
                  child: Image(
                    image: AssetImage('img/2.jpg'),
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  opacity: 0.40,
                ),
                color: Colors.black,
              ),
              Center(
                child: Container(
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.8,
                  child: Card(
                    elevation: 20,
                    color: Colors.black45,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage('img/1.png'),
                            ),
                          ),
                          Text(
                            'Welcome to Movie Reviews',
                            style: welcomeReviewStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'You can watch review of all the movies you want and you can also post your own review',
                            style: ownReviewStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          AnimatedCrossFade(
                            firstChild: ReusableCodeInWelComeScreen(
                              text1: 'Login',
                              text2: 'Or SignUp',
                              labelTextForEmail: 'SignUp with your email',
                              onSubmitted: (value) async {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                try {
                                    final user =
                                        await _auth.signInWithEmailAndPassword(
                                            email: email, password: password);
                                    if (user != null) {
                                  Navigator.pushNamed(context, HomePage.id);
                                     }

                                    setState(() {
                                      showSpinner = false;
                                    });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              onTap: () {
                                setState(() {
                                  counter = 2;
                                });
                              },
                            ),
                            secondChild: ReusableCodeInWelComeScreen(
                              text1: 'SignUp',
                              text2: 'Or Login',
                              labelTextForEmail: 'Enter your loggedIn email',
                              onSubmitted: (value) async {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                try {
                                    final newUser = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    if (newUser != null) {
                                  Navigator.pushNamed(context, Loading3.id);
                                    }

                                    setState(() {
                                      showSpinner = false;
                                    });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              onTap: () {
                                setState(() {
                                  counter = 1;
                                });
                              },
                            ),
                            crossFadeState: (counter == 1)
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: Duration(
                              milliseconds: 800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
