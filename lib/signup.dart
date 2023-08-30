import 'package:chat_room/Home.dart';                       // MyHomePage(title: 'Chat Room');
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
import 'package:chat_room/entermobilenumber.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  final nameController = TextEditingController();

  void dispose(){
    super.dispose();
    nameController.dispose();

  }

  final _formKey = GlobalKey<FormState>();

  bool _isLoading0 = false;
   void _handleClick0 () {
    setState(() {
      _isLoading0 = true;
      setState(() {
        Future.delayed(Duration(seconds: 2),
            (){
          _isLoading0 = false;
          Navigator.push(context, MaterialPageRoute(builder: (context){return entermobilenumber();}));
            }
        );
      });
    });
  }
  bool _isLoading1 = false;
  void _handleClick1 () {
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 50,bottom: 150,left: 0,right: 0),
                    child: Container(
                      height: 65,
                        width: 250,
                        child: Lottie.asset("assets/animations/welcomeanimation.json"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 50,left: 0,right: 0),
                    child: Container(
                     height: 260,
                      width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 2,color: Colors.white30),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50,bottom: 0,left: 0,right: 0),
                            child: Container(
                                width: 280,
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (value){
                                    if(value!.isEmpty){  // ! is called null check
                                      return "please enter full name";
                                    }else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.blue,),
                                    suffixIcon: IconButton(onPressed: (){},icon: Icon(FontAwesomeIcons.user,color: Colors.black,),),
                                    hintText: "Enter your full name",
                                    hintStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                                    helperText: "   abcd efgh",
                                    helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ),
                          ),


                            Padding(
                              padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:30 ),
                              child: SizedBox(
                                height: 60,
                                width: 320,
                                child: ElevatedButton(
                                  onPressed: _isLoading0 ?null
                                        : (){
                              if( _formKey.currentState!.validate() ){
                              // If the form is valid, you can proceed with your logic here
                              _handleClick0();

                              }
                              },
                                  child: _isLoading0 ?CircularProgressIndicator()
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
                          onPressed: _isLoading1 ?null:_handleClick1,
                          child: _isLoading1 ?CircularProgressIndicator()
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
      ),
    );
  }
}
