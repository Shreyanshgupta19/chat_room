import 'package:chat_room/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class VoiceCalls extends StatefulWidget {
  const VoiceCalls({super.key});

  @override
  State<VoiceCalls> createState() => _VoiceCallsState();
}

class _VoiceCallsState extends State<VoiceCalls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
