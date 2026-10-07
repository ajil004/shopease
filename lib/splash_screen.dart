import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

 

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2FFF5),

      body: SafeArea(
        child: Stack(
          children: [

            // Top circle
            Positioned(
              top: -80,
              left: -80,
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  color: Color(0xffD9F3DF),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Bottom circle
            Positioned(
              bottom: -80,
              right: -70,
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  color: Color(0xffD9F3DF),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Logo
                  Container(
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Color(0xff159447),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 55,
                    ),
                  ),

                  SizedBox(height: 20),

                  // ShopEase
                  RichText(
                    text: TextSpan(
                      children: [

                        TextSpan(
                          text: "Shop",
                          style: TextStyle(
                            color: Color(0xff07182E),
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        TextSpan(
                          text: "Ease",
                          style: TextStyle(
                            color: Color(0xff159447),
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Better Products  Better Life",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 150),

                  Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color(0xff159447),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  SizedBox(height: 25),

                  Text(
                    "Your one-stop shop for",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),

                  Text(
                    "everything you need",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}