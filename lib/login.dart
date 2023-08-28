import 'package:chat_room/Home.dart';
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
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

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _obscureText = true;
  void _passwordVisibility(){
    setState(() {
      _obscureText =! _obscureText;
    });
  }

  bool _isloading0 = false;
  void _handleClick0 () {
    setState(() {
      _isloading0 = true;
      Future.delayed(Duration(seconds: 2),
              (){
            setState(() {
              _isloading0 = false;
              Navigator.push(context, MaterialPageRoute(builder: (context){return entermobilenumber();}));
            });
          }
      );
    });
  }

  bool _isLoading1 = false;
  void _handleClick1 () {
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

  bool _isLoading2 = false;
  void _handleClick2 () {
    setState(() {
      _isLoading2 = true;
      Future.delayed(Duration(seconds: 2),
              (){
            setState(() {
              _isLoading2 = false;
              Navigator.push(context, MaterialPageRoute(builder: (context){return signup();}));
            });
          }
      );
    });
  }

  bool _isLoading3 = false;
  void _handleClick3 () {
    setState(() {
      _isLoading3 = true;
      Future.delayed(Duration(seconds: 2),
              (){
            setState(() {
              _isLoading3 = false;
              Navigator.push(context, MaterialPageRoute(builder: (context){return MyHomePage(title: 'Chat Room');;}));
            });
          }
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(             // for dual color
          //   begin:Alignment.center ,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Colors.black12,
          //     Colors.black87,
          //   ],
          // ),
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(

          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
   child: SingleChildScrollView(
       physics: BouncingScrollPhysics(),   // use for on click scrollable Textfields
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:60 ),
             child: Container(
               height: 200,
               width: 400,
               child: Lottie.asset("assets/animations/loginanimation.json"),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 0,right:0 ,bottom:50 ,top:0 ),
             child: Container(
                height: 370,
                width: 350,
                 decoration: BoxDecoration(
                   color: Colors.white.withOpacity(0.3),
                   borderRadius: BorderRadius.circular(25),
                   border: Border.all(width: 2,color: Colors.white30),
                 ),
                 child: Column(
                   children: [

                     Padding(
                       padding: const EdgeInsets.only(left: 0,right:0 ,bottom:0 ,top:30 ),
                       child: Container(
                           width: 280,
                           child: TextFormField(
                             keyboardType: TextInputType.emailAddress,
                             style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                             decoration: InputDecoration(
                               suffixIcon: IconButton(onPressed:(){},icon: Icon(Icons.contact_mail,size: 25,color: Colors.blue,),),
                               hintText: "Enter User Id",
                               helperText: "e.g 123456789",
                               helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)
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
                             obscureText: _obscureText,
                             obscuringCharacter: "*",
                             style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
                             decoration: InputDecoration(
                               suffixIcon: IconButton(
                                 onPressed: _passwordVisibility,
                                 icon:Icon( _obscureText?CupertinoIcons.eye:CupertinoIcons.eye_slash,
                                   color: Colors.blue,),
                               ),
                               prefixIcon: Icon(CupertinoIcons.lock_fill,size: 20,color: Colors.black87,),
                               hintText: "Enter your password",
                               helperText: "Password should be at least 8 characters",
                               helperStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                             ),
                           ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 2,bottom: 4),
                       child: Center(
                         child: TextButton(
                           onPressed: _isloading0?null:_handleClick0,
                           child: _isloading0?CircularProgressIndicator()
                               : Text("Forgot Password",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.blue,
                             fontSize: 15
                           ),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 0,right: 0,bottom: 8,top: 5),
                       child: SizedBox(
                         height: 60,
                         width: 320,
                         child: ElevatedButton(
                           onPressed: _isLoading1?null:_handleClick1,
                           child:_isLoading1?CircularProgressIndicator()
                                 : Text("Log In"),
                           style: ElevatedButton.styleFrom(
                             primary: Colors.black,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30),
                             ),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 100,right: 0,top: 2,bottom: 0),
                       child: Row(
                         children: [
                           Text("Not a member? "),
                         TextButton(
                           onPressed: _isLoading2?null:_handleClick2,
                           child:_isLoading2?CircularProgressIndicator()
                                 : Text("Register Now"), )
                         ],
                       ),
                     )
                   ],
                 ),
),
           ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Continue with Google",
            style: TextStyle(
                color: Colors.white38,
                fontSize: 18,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: InkWell(
                 onTap: _isLoading3?null:_handleClick3,
                 child: _isLoading3?CircularProgressIndicator()
                   : Container(
                   height: 50,
                   width: 50,
                   child: Image.asset("assets/images/googlelogo.png"),
                 ),
             ),
           )
         ],
       ),
   ),
 ),


          ),
        ),
      ),
    );
  }
}
