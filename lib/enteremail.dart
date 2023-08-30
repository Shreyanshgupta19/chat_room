import 'package:chat_room/Home.dart';
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
import 'package:chat_room/emailverification.dart';
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


class enteremail extends StatefulWidget {
  const enteremail({super.key});

  @override
  State<enteremail> createState() => _enteremailState();
}

class _enteremailState extends State<enteremail> {

  final _formKey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();
  void dispose (){

    emailcontroller.dispose();
    super.dispose();
  }

  bool _isLoading = false;
  void  _handleClick () {
    setState(() {
      _isLoading = true;
      Future.delayed( Duration( seconds: 2 ),
              (){
        setState(() {
          _isLoading = false;
          Navigator.push(context, MaterialPageRoute(builder: (context){ return emailverification();}));
        });
      } );
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45,bottom: 25,left: 0,right: 0),
                    child: Lottie.asset("assets/animations/gmailanimation.json",
                        height: 250,
                        width: 250,
                    ),
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
                                  controller: emailcontroller,
                                  validator: (value){
                                    if(value!.isEmpty){  // ! is called null check
                                      return "please enter email id";
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                     errorStyle: TextStyle(color: Colors.blue),
                                      hintText: "Enter your email id",
                                      hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,),
                                      suffixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                                      helperText: "  xyz@gmail.com  ",
                                      helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,)
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18,bottom: 0,left: 0,right: 0),
                                  child: Text("We will send verification code on your email id.",
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
                              onPressed: _isLoading?null
                                  : (){
                                if( _formKey.currentState!.validate() ){
                                  // If the form is valid, you can proceed with your logic here
                                 _handleClick();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),

                                ),
                              ),
                              child:_isLoading
                                  ?CircularProgressIndicator()
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
      ),
    );
  }
}
