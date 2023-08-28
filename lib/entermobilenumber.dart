import 'package:chat_room/Home.dart';
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
import 'package:chat_room/enteremail.dart';
import 'package:chat_room/main.dart';
import 'package:chat_room/newpassword.dart';
import 'package:chat_room/otpverification.dart';
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

class entermobilenumber extends StatefulWidget {
  const entermobilenumber({super.key});

  @override
  State<entermobilenumber> createState() => _entermobilenumberState();
}

class _entermobilenumberState extends State<entermobilenumber> {

  bool _isLoading = false;

  void _handleLock (){
    setState(() {
      _isLoading = true;
      Future.delayed(Duration(seconds: 2),
          (){
        setState(() {
          _isLoading = false;
          Navigator.push(context, MaterialPageRoute(builder: (context){return otpverification();}));
        });
          }
      );
    });
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
    padding: const EdgeInsets.all(8.0),
    child: Lottie.asset("assets/animations/mobilenumberanimation.json"),
  ),
  Container(
  height: 250,
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
              width: 260,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        hintText: "Enter your mobile number",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                        suffixIcon: Icon(Icons.call_sharp,color: Colors.black,),
                        helperText: "  123456789  ",
                        helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,)
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18,bottom: 0,left: 0,right: 0),
                      child: Text("We will send you a one time sms message.",
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
                onPressed: _isLoading ?null: _handleLock,
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),

                  ),
                ),
                child: _isLoading? CircularProgressIndicator()
                      : Text("Submit"),
              ),
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
