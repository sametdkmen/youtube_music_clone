import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset('images/logo/white_logo.svg',
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
      ),
    );
  }
}
