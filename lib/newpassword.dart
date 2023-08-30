import 'package:chat_room/Home.dart';
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
import 'package:chat_room/changepassword.dart';
import 'package:chat_room/login.dart';
import 'package:chat_room/main.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class newpassword extends StatefulWidget {
  const newpassword({super.key});

  @override
  State<newpassword> createState() => _newpasswordState();
}

class _newpasswordState extends State<newpassword> {

  final newController = TextEditingController();
  final confirmController = TextEditingController();

  void dispose(){
    super.dispose();
    newController.dispose();
    confirmController.dispose();
  }

  final _formKey = GlobalKey<FormState>();


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

  bool _isLoading = false;

  void _handleClick () {
    setState(() {
      _isLoading = true;
      Future.delayed(Duration(seconds: 2),
          (){
        _isLoading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context){return login();}));
          }
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/signupbackground.jpeg"),
        fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
body: Center(
  child: SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Form(
      key: _formKey,
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4,bottom: 0,left: 0,right: 0),
              child: Container(
              height: 200,
                  width: 200,
                  child: Lottie.asset("assets/animations/forgotpassword.json",fit: BoxFit.cover,),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 4,bottom: 0,left: 0,right: 0),
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 8),
                    child: Text("Create a new password you haven't used before",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 0,left: 0,right: 0),
              child: Container(
                height: 200,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2,color: Colors.white),
                  ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom:0 ,right:0 ,left:0 ),
                      child: Container(
                          width: 280,
                          child: TextFormField(
                            controller: newController,
                            validator: (value){
                              if(value!.isEmpty){  // ! is called null check
                                return "please enter password";
                              }
                              if(value.length < 8 ){
                                return "Please enter at least 8 characters";
                              }

                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscureText1,
                            obscuringCharacter: "*",
                            style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.blue),
                              hintText: "New Password",
                              suffixIcon: IconButton(
                                onPressed: _passwordVisibility1,
                                icon: Icon(_obscureText1?CupertinoIcons.eye:CupertinoIcons.eye_slash,color: Colors.blue,),
                              ),
                           helperText: "Password should be at least 8 characters",
                              helperStyle: TextStyle(
                                fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8,bottom: 0),
                      child: Container(
                        width: 280,
                          child: TextFormField(
                            controller: confirmController,
                            validator: (value){
                              if(value!.isEmpty){  // ! is called null check
                                return "please enter password";
                              }if(value.length < 8 ){
                                return "Please enter at least 8 characters";
                              }
                              if(newController.text != confirmController.text){    // because controller catch the textfield input
                                return "Pssword do not match";
                               }
                               // else{
                              // return null;
                              // }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscureText2,
                            obscuringCharacter: "*",
                            style: TextStyle(fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.blue),
                            hintText: "Confirm Password",
                              hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                              suffixIcon: IconButton(
                                onPressed: _passwordVisibility2,
                                icon: Icon(_obscureText2?CupertinoIcons.eye:CupertinoIcons.eye_slash_fill,color: Colors.blue,),
                              ),
                              prefixIcon: Icon(CupertinoIcons.lock_fill,color: Colors.black,),
                              helperText: "Password should be at least 8 characters",
                              helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 0,left: 0,right: 0),
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 8),
                    child: Text("Use a combination of letters, numbers and special characters",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60,bottom: 8,left: 0,right: 0),
              child: SizedBox(
                height: 60,
                width: 320,
                child: ElevatedButton(
                  onPressed: _isLoading? null
                      : (){
                    if( _formKey.currentState!.validate() ){
                      // If the form is valid, you can proceed with your logic here
                      _handleClick();
                    }
                  },
                  child: _isLoading? CircularProgressIndicator()
                        : Text("Submit"),
                style: ElevatedButton.styleFrom(
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
      ),
    );
  }
}
