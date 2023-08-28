import 'package:chat_room/login.dart';
import 'package:chat_room/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

                                      // timing
  void initState(){
    super.initState();                // super keyword calls initState() parent class : _SplashScreenState
    Timer( Duration(seconds: 6),(){
      Navigator.push(context, MaterialPageRoute(builder: (context){return login();}));
    }
    );
  }                                 // closed

                                     // designing
@override
  Widget build(BuildContext context){
  return Scaffold(
//   backgroundColor: Colors.black,    // for double shade
      body: Container(
        width: double.infinity,
        height: double.infinity,
       color: Colors.black,

 // decoration: BoxDecoration(      // for double shade
 //   gradient: LinearGradient(
 //     begin: Alignment.center,
 //       end: Alignment.bottomCenter,
 //       colors: [
 //         Colors.black12,
 //         Colors.grey.shade900,
 //       ],
 //   ),
 // ),
        child: Center(

child: Padding(
    padding: const EdgeInsets.fromLTRB(15,50,8,8),   //  (left, top, right, bottom),

    child:   Column(
        children: [
          Container(
              height: 100,
              width: 300,
              child: Center(child: Image.asset("assets/images/Newlogoname.png")) ),
LottieBuilder.asset("assets/animations/animation_llcazxhg.json"),

          Container(
              height: 100,
              width: 200,
              child: Lottie.asset("assets/animations/animation_llc77ton.json",animate: true)
          ),

     Container(
           height: 100,
           width: 400,
           
           child: Lottie.asset("assets/animations/animation_llc74kmy.json",
               animate: true,
           )
          ),

        ],
    ),
),

        ),
      ),
    );

}                                        // closed



}
