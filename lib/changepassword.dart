import 'dart:ffi';

import 'package:chat_room/Home.dart';
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
import 'package:chat_room/entermobilenumber.dart';
import 'package:chat_room/main.dart';
import 'package:chat_room/newpassword.dart';
import 'package:chat_room/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class changepassword extends StatefulWidget {
  const changepassword({super.key});

  @override
  State<changepassword> createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {

  bool _isLoading1 = false;
  void _handleLock1(){
    setState(() {
      _isLoading1 = true;
      Future.delayed(Duration(seconds: 2),
          (){
        setState(() {
          _isLoading1 = false;
          Navigator.push(context, MaterialPageRoute(builder: (context){return entermobilenumber();}));
        });
          }
      );
    });
  }

  bool _isLoading2 = false;
  void _handleLock2(){
    setState(() {
      _isLoading2 = true;
      Future.delayed(Duration(seconds: 2),
          (){
        setState(() {
      _isLoading2 = false;
      Navigator.push(context, MaterialPageRoute(builder: (context){return MyHomePage(title: 'Chat Room');;}));
        });
      }
      );
    });
  }

   bool _obscureText1 = true;
  void _passwordVisibility1(){
    setState(() {
      _obscureText1 =! _obscureText1;
    });
  }

  bool _obscureText2 = true;
  void _passwordVisibility2(){
    setState(() {
      _obscureText2 =! _obscureText2;
    });
  }

  bool _obscureText3 = true;
  void _passwordVisibility3(){
    setState(() {
      _obscureText3 =! _obscureText3;

     });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/changepasswordbackground.jpeg"),
            fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children : [
                  Padding(
                    padding: const EdgeInsets.only(top: 60,bottom: 0,left: 0,right: 0),
                    child: Container(
                      height: 180,
                      width: 190,
                     child: Lottie.asset("assets/animations/changepasswordanimation.json",
                          fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 0,left: 0,right: 0),
                  child: Container(
                    height: 300,
                    width: 320,
                  decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                   borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 2,color: Colors.white),
                  ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 0,left: 0,right: 0),
                          child: Container(
                              width: 280,
                              child: TextFormField(
                               keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText1,
                                obscuringCharacter: "*",
                                style: TextStyle(fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: _passwordVisibility1,
                                      icon: Icon(_obscureText1?CupertinoIcons.eye:CupertinoIcons.eye_slash,color: Colors.blue,),
                                  ),
                                  hintText: "Current Password",
                                  hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                                  helperText: "Password should be at least 8 characters",
                                  helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),

                                ),
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8 ,bottom: 0 ,left: 0,right: 0),
                          child: Container(
                              width: 280,
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText2,
                                obscuringCharacter: "*",
                                style: TextStyle(fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,),
                                decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: _passwordVisibility2,
                                    icon: Icon(_obscureText2?CupertinoIcons.eye:CupertinoIcons.eye_slash,color: Colors.blue,),
                                ),
                                  hintText: "New Password",
                                  hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                                  helperText: "Password should be at least 8 characters",
                                  helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),

                                ),
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8 ,bottom: 8 ,left: 0,right: 0),
                          child: Container(
                              width: 280,
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText3,
                                obscuringCharacter: "*",
                                style: TextStyle(fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,),
                                decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: _passwordVisibility3,
                                    icon: Icon(_obscureText3?CupertinoIcons.eye:CupertinoIcons.eye_slash_fill,color: Colors.blue,),
                                ),
                               prefixIcon: Icon(Icons.lock,color: Colors.black,),
                                  hintText: "Confirm Password",
                                  helperText: "Password should be at least 8 characters",
                                  hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                                  helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),
                                ),
                              ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8,bottom: 0,left: 26,right: 5),
                        child: Text("Create a new password you haven't used before and use a combination of letters, numbers and special characters",
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 0,left: 0,right: 0),
                    child: TextButton(
                      onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context){return ;}));
                    },
                      child: TextButton(
                        onPressed: _isLoading1?null:_handleLock1,
                        child: _isLoading1?CircularProgressIndicator()
                             : Text("Try another way",
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                    ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20,left: 0,right: 0),
                  child: SizedBox(
                    height: 60,
                    width: 320,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                      onPressed: _isLoading2?null:_handleLock2,
                      child:_isLoading2?CircularProgressIndicator()
                            : Text("Submit"),
                    ),
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
