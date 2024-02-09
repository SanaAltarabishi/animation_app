import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/color_screen.dart';

import 'package:app/core/get_it.dart';
import 'package:app/direction.dart';
import 'package:app/lamp_screen.dart/lamp.dart';
import 'package:app/size.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffD6E2EA),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.25,
                padding: EdgeInsets.only(
                    left: screenWidth * .03, top: screenHeight * .03),
                decoration: BoxDecoration(
                    color: Color(0xff6076D1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * .01, left: screenWidth * 0.01),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
//?


                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Hello ${getIt.get<SharedPreferences>().getString('user_name') ?? ''}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * .03,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.01),
                      width: screenWidth * 2,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Where would you like to start?',
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          TyperAnimatedText(
                            'Have fun while you learn! ',
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                    color: Color(0xff6076D1),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.08,
                  right: screenWidth * 0.08,
                ),
                child: InkWell(
                  onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder:(context) =>DirectionPage(),));
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.asset(
                          'image/directions.webp',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      Text(
                        'Learn directions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                    color: Color(0xff6076D1),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.08,
                  right: screenWidth * 0.08,
                ),
                child: InkWell(
                  onTap: () {
             Navigator.push(context,MaterialPageRoute(builder:(context) => ColorPage(),));
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.asset(
                          'image/colors.jpg',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      Text(
                        'Learn Colors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                    color: Color(0xff6076D1),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.08,
                  right: screenWidth * 0.08,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) =>SizedPage() ,));
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.asset(
                          'image/size.jpg',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      Text(
                        'Learn size',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                    color: Color(0xff6076D1),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.08,
                  right: screenWidth * 0.08,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LivingHomePage(),
                        ));
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.asset(
                          'image/lamps.jpg',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      Text(
                        'Learn switch on/off',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
