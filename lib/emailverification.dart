import 'package:chat_room/Home.dart';
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
import 'package:chat_room/enteremail.dart';
import 'package:chat_room/entermobilenumber.dart';
import 'package:chat_room/main.dart';
import 'package:chat_room/newpassword.dart';
import 'package:chat_room/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class emailverification extends StatefulWidget {
  const emailverification({super.key});

  @override
  State<emailverification> createState() => _emailverificationState();
}

class _emailverificationState extends State<emailverification> {
  final _formKey = GlobalKey<FormState>();

  final _otpController = TextEditingController();

  void dispose_a (){

    _otpController.dispose();
    super.dispose();
  }

  int _remainingTime = 60;
  late Timer _timer;

  bool _isloading = false;

void _handleClick(){
  setState(() {
    _isloading = true;

    Future.delayed(Duration(seconds: 2),
            (){
      setState(() {
        _isloading= false;

        Navigator.push(context, MaterialPageRoute(builder: (context){return newpassword();}));
      });
    });
  });
}


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, (Timer timer) { //      Timer.periodic( duration, (timer) {} )

      if (_remainingTime == 0) { // logic inside the timer function
        setState(() {
          timer.cancel();
        });
      }
      else {
        setState(() {
          _remainingTime--;
        });
      }
    },
    );
  }
  String formatTime(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  void resendOtp() {
    if (_remainingTime == 0) {
      _remainingTime = 60;
      startTimer();
    }
  }


  void dispose_b () {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/emailverificationbackground.jpeg"),
          fit: BoxFit.cover,
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 0),
                    child: Lottie.asset("assets/animations/emailverificationanimation.json",
                        height: 340,
                        width: 340

                    ),
                  ),
                  Container(
                    height: 380,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 2,color: Colors.white,),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 4,left: 0,right: 0),
                          child: Container(
                            width: 200,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _otpController,
                                  validator: (value){
                                    if( value!.isEmpty){
                                      return "Please enter code";
                                    }
                                    if(value.length < 4 ){
                                      return "Please enter valid code";
                                    }
                                    // else{
                                    // return null;
                                    // }

                                  },
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(4),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(


                                    errorStyle: TextStyle(color: Colors.blue,),  // error text color
                                    errorBorder: OutlineInputBorder(             // error textfield border
                                      borderRadius: BorderRadius.circular(21),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1,
                                      ),

                                    ),
                                    hintText: "Enter code",
                                    hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(21),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 1,
                                        )
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(21),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(21),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )

                                    ),
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18,bottom: 0,left: 0,right: 0),
                                  child: Text("Enter the 4 digit code we sent you via email to continue",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),

                              ],
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25,bottom: 0,left: 0,right: 0),
                          child: SizedBox(
                            height: 60,
                            width: 320,
                            child: ElevatedButton(
                              onPressed:_isloading ? null
                                  :(){
                                if( _formKey.currentState!.validate() ) {
                                  _handleClick();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),

                                ),
                              ),
                              child: _isloading
                                  ?CircularProgressIndicator()

                                    :Text("Verify"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18,bottom: 0,left: 0,right: 0),
                          child: Column(
                            children: [
                              Text("Did't receive the verification code?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                ),
                              ),
                              Text(formatTime(_remainingTime),
                              style: TextStyle(fontSize: 15),
                              ),
                              TextButton(
                                onPressed: resendOtp,
                                child: Text("Resend again",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
