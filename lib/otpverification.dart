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

class otpverification extends StatefulWidget {
  const otpverification({super.key});

  @override
  State<otpverification> createState() => _otpverificationState();
}

class _otpverificationState extends State<otpverification> {

  int _remainingTime = 60;
  late Timer _timer;

  bool _isLoading = false;

  void _handleLock (){
   setState(() {
     _isLoading = true;
     Future.delayed( Duration( seconds: 2 ),
             () {
       setState( () {
         _isLoading = false;
         Navigator.push(context, MaterialPageRoute(builder: (context){return enteremail();}));
       }  );
     }

     );
   });
  }

  void initState(){
    super.initState();
    startTimer();
  }

  void startTimer(){
    const onSec = Duration(seconds: 1);
    _timer = Timer.periodic(onSec, (Timer timer) {
    if ( _remainingTime == 0 ){
      setState(() {
        timer.cancel();
      });
    }
    else{
       setState( () {
        _remainingTime--;
      }  );
           }
              }
                 );
                    }
    String formatTime ( int seconds ){
    int minutes = ( seconds / 60 ).floor();
    int remaningSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2,"0");
    String secondsStr = remaningSeconds.toString().padLeft(2,"0");
    return "$minutesStr:$secondsStr";
                    }
  void resendOtp() {
    if (_remainingTime == 0) {
      _remainingTime = 60;
      startTimer();
    }
  }
  void dipose(){
    _timer.cancel();    // it removes the Timer.periodic method
    super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/otpverificationbackground.jpeg"),
          fit: BoxFit.cover,
        ),
      ),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 0),
                    child: Lottie.asset("assets/animations/otpanimation.json",
                        height: 340,
                      width: 340

                    ),
                  ),
                  Container(
                    height: 330,
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
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(4),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                      hintText: "Enter otp",
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
                                  child: Text("Enter your OTP code here",
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
                              onPressed: _isLoading ? null : _handleLock,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),

                                ),
                              ),
                              child: _isLoading
                                ? CircularProgressIndicator()
                                  : Text("Verify"),
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
                              Text( formatTime(_remainingTime),
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
    );
  }
}
