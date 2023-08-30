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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class changepassword extends StatefulWidget {
  const changepassword({super.key});

  @override
  State<changepassword> createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {

  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  void dispose(){
    super.dispose();
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
  }

  final _formKey = GlobalKey<FormState>();


  bool _isLoading0 = false;
  void _handleLock0(){
    setState(() {
      _isLoading0 = true;
      Future.delayed(Duration(seconds: 2),
          (){
        setState(() {
          _isLoading0 = false;
          Navigator.push(context, MaterialPageRoute(builder: (context){return entermobilenumber();}));
        });
          }
      );
    });
  }

  bool _isLoading1 = false;
  void _handleClick1(){
    setState(() {
      _isLoading1 = true;
      Future.delayed(Duration(seconds: 2),
          (){
        setState(() {
      _isLoading1 = false;
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
              child: Form(
                key: _formKey,
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
                                  controller: currentController,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "please enter password";
                                    }
                                    if(value.length < 8 ){
                                      return "Please enter at least 8 characters";
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                 keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscureText1,
                                  obscuringCharacter: "*",
                                  style: TextStyle(fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,),
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.blue,),
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
                                  controller: newController,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "please enter password";
                                    }
                                    if(value.length < 8 ){
                                      return "Please enter at least 8 characters";
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscureText2,
                                  obscuringCharacter: "*",
                                  style: TextStyle(fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,),
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.blue,),
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
                                  controller: confirmController,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "please enter password";
                                    }
                                    if(value.length < 8 ){
                                      return "Please enter at least 8 characters";
                                    }
                                    if(newController.text != confirmController.text){    // because controller catch the textfield input
                                      return "Pssword do not match";
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscureText3,
                                  obscuringCharacter: "*",
                                  style: TextStyle(fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,),
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.blue,),
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
                          onPressed: _isLoading0?null:_handleLock0,
                          child: _isLoading0?CircularProgressIndicator()
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
                        onPressed: _isLoading1?null
                           : (){
                    if( _formKey.currentState!.validate() ){
                    // If the form is valid, you can proceed with your logic here
                    _handleClick1();

                    }
                    },
                        child:_isLoading1?CircularProgressIndicator()
                              : Text("Submit"),
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
