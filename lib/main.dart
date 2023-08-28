import 'package:chat_room/Home.dart';
import 'package:chat_room/SplashScreen.dart';
import 'package:chat_room/VideoCalls.dart';
import 'package:chat_room/VoiceCalls.dart';
import 'package:chat_room/changepassword.dart';
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int _currentIndex = 0;


class _MyHomePageState extends State<MyHomePage> {

  final screens = [
    Home(),
    VoiceCalls(),
    VideoCalls(),
  ];

  @override
  Widget build(BuildContext context) {

    return
      DefaultTabController(
      length: 3,
      child:
      WillPopScope(
        onWillPop: ()async{
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,

            actions : [


          Padding(
            padding: const EdgeInsets.only(left: 11.0,top: 10,right: 1.0,bottom:8 ),
            child: Text("Chat Room",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                  ),
                ),
          ),


              Padding(
                padding: const EdgeInsets.only(left: 160.0,top: 9.0,right: 0.0,bottom: 20),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,size: 30,)),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0,top: 9.0,right: 9.0,bottom: 20),
                    child :PopupMenuButton(
                      icon: Icon(Icons.settings,color: Colors.white,),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              child: Column(
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context){return changepassword();}));
                                        },
                                        child: Text("Change Password",style: TextStyle(color: Colors.black),))
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context){return login();}));
                                        },
                                        child: Text("Log Out",style: TextStyle(color: Colors.black),))
                                  ],
                                ),
                              ),

                            ],
                              )
                               ),
                        ]
                    ),
            )

            ],
          backgroundColor: Colors.black,

          ),
          body: Column(
                      children: [
                        GNav(

                          selectedIndex: _currentIndex,
                          onTabChange: (value){
                            setState(() {
                              _currentIndex = value;
                            });
                          },
                            backgroundColor: Colors.black,
                            color: Colors.white,
                            activeColor: Colors.white,
                            tabBackgroundColor: Colors.grey.shade800,
                            gap: 8,
                            padding: EdgeInsets.all(25),
                            tabs: [
                          GButton(
                            icon: Icons.home,
                            text: "Home",
                            iconColor: Colors.white,
                            onPressed: (){
                              print("one click on home button");
                            },
                          ),
                          GButton(
                            icon: Icons.call,
                            text: "Voice Calls",
                            iconColor: Colors.white,
                            onPressed: (){
                              print("one click on home button");
                            },
                          ),
                          GButton(
                            icon: Icons.video_call,
                            text: "Video Calls",
                            iconColor: Colors.white,
                            onPressed: (){
                              print("one click on home button");
                            },
                          ),


                        ],
                        ),
                        Expanded(
                            child: screens[_currentIndex]
                        ), // Body content

                      ],
                    ),

        ),
      ),
    );
  }
}

