

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splashchecking(context);
    return Scaffold(
      body: Center(
        child:  Container(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width/2,
          child: Lottie.asset("assets/blood donate animation.json",repeat: false))
      ),
    );
  }

  void splashchecking(BuildContext context)async{
          await Future.delayed(const Duration(seconds: 1));
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const Home()));

  }
}