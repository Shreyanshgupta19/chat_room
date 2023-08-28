import 'package:chat_room/Home.dart';                       // MyHomePage(title: 'Chat Room');
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
import 'package:chat_room/login.dart';
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

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  bool _isLoading1 = false;
   void _handleLock1 () {
    setState(() {
      _isLoading1 = true;
      setState(() {
        Future.delayed(Duration(seconds: 2),
            (){
          _isLoading1 = false;
          Navigator.push(context, MaterialPageRoute(builder: (context){return login();}));
            }
        );
      });
    });
  }
  bool _isLoading2 = false;
  void _handleLock2 () {
    setState(() {
      _isLoading2 = true;
      setState(() {
        Future.delayed(Duration(seconds: 2),
                (){
              _isLoading2 = false;
              Navigator.push(context, MaterialPageRoute(builder: (context){return login();}));
            }
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/signupbackground.jpeg'),
        fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 50,bottom: 10,left: 0,right: 0),
                  child: Container(
                    height: 65,
                      width: 250,
                      child: Lottie.asset("assets/animations/welcomeanimation.json"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0,bottom: 50,left: 0,right: 0),
                  child: Container(
                   height: 500,
                    width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 2,color: Colors.white30),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30,bottom: 0,left: 0,right: 0),
                          child: Container(
                              width: 280,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(onPressed: (){},icon: Icon(FontAwesomeIcons.user,),),
                                  hintText: "Enter your full name",
                                  hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                                  helperText: "   abcd efgh",
                                  helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                                ),
                              ),
                          ),
                        ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:5 ),
                                    child: Container(
                                       width: 280,
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                           decoration: InputDecoration(
                                             suffixIcon: IconButton(onPressed: (){},icon: Icon(CupertinoIcons.mail,),),
                                             hintText: "Enter your email ",
                                             hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                                             helperText: "   xyz@gmail.com",
                                             helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                                           ),
                                        ),
                                    ),
                                  ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:5 ),
                          child: Container(
                            width: 280,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.start,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.call,),),
                                  hintText: "Enter your mobile number",
                                    hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                                  helperText: "  123456789",
                                  helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),
                                ),
                              ),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:5 ),
                            child: Container(
                                width: 280,
                                child: TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(onPressed: (){},icon: Icon(CupertinoIcons.eye_slash),),
                                    hintText: "Enter your password",
                                    hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                                    helperText: "  Your password should be at least 8 characters",
                                    helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)
                                  ),
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:5 ),
                            child: Container(
                                width: 280,
                                child: TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.lock),),
                                  hintText: "Confirm password",
                                   hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                                    helperText: "  Your password should be at least 8 characters",
                                    helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),
                                  ),
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:5 ),
                            child: SizedBox(
                              height: 60,
                              width: 320,
                              child: ElevatedButton(
                                onPressed: _isLoading1 ?null:_handleLock1,
                                child: _isLoading1 ?CircularProgressIndicator()
                                    : Text("Sign Up"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )
                              ),
                              ),
                            ),
                          ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0,right:0 ,bottom:8 ,top:4 ),
                  child: Text("Already have an account?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15,),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:5 ),
                  child: SizedBox(
                    height: 60,
                    width: 320,
                    child: ElevatedButton(
                        onPressed: _isLoading2 ?null:_handleLock2,
                        child: _isLoading2 ?CircularProgressIndicator()
                            : Text("Log in"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
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
