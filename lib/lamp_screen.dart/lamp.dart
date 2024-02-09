import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/lamp_screen.dart/lamp_bulb.dart';
import 'package:app/lamp_screen.dart/lamp_hanger_rope.dart';
import 'package:app/lamp_screen.dart/lamp_switch.dart';
import 'package:app/lamp_screen.dart/lamp_switch_rope.dart';
import 'package:flutter/material.dart';

final darkGray = const Color(0xff6076D1);
//final darkGray = const Color(0xFF232323);
final bulbOnColor = const Color(0xFFFFE12C);
final bulbOffColor = const Color(0xFFC1C1C1);
final gradientStartColor = const Color(0xFFDF3B0);
final gradientEndColor = const Color(0xFFFFFFED);
final animationDuration = const Duration(milliseconds: 500);

class LivingHomePage extends StatefulWidget {
  @override
  State<LivingHomePage> createState() => _LivingHomePageState();
}

class _LivingHomePageState extends State<LivingHomePage> {
  var _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeighy = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              LampHangerRope(
                screenHeighy: screenHeighy,
                screenWidth: screenWidth,
                color: darkGray,
              ),
              LampBulb(
                screenHeighy: screenHeighy,
                screenWidth: screenWidth,
                onColor: bulbOnColor,
                offColor: bulbOffColor,
                isSwitchOn: _isSwitchOn,
              ),
              Lamp(
                screenHeighy: screenHeighy,
                screenWidth: screenWidth,
                color: darkGray,
                gradientColor: gradientStartColor,
                animationDuration: animationDuration,
                isSwitchOn: _isSwitchOn,
              ),
              LampSwitch(
                isSwitchOn: _isSwitchOn,
                screenHeighy: screenHeighy,
                screenWidth: screenWidth,
                animationDuration: animationDuration,
                onColor: bulbOnColor,
                offColor: bulbOffColor,
                color: darkGray,
                onTap: () {
                  setState(() {
                    _isSwitchOn = !_isSwitchOn;
                  });
                },
              ),
              LampSwitchRope(
                screenHeighy: screenHeighy,
                screenWidth: screenWidth,
                isSwitchOn: _isSwitchOn,
                color: darkGray,
                animationDuration: animationDuration,
              ),
              Positioned(
                  top: screenHeighy * 0.65,
                  right: screenWidth * 0.6,
                  child: _isSwitchOn
                      ? 
                       AnimatedTextKit(animatedTexts: [
                          RotateAnimatedText(
                              "Don't forget to turn off ",textStyle: TextStyle(fontSize:15)),
                          RotateAnimatedText('Switch it off',textStyle: TextStyle(fontSize:15)),
                          RotateAnimatedText('turn off the lamp',textStyle: TextStyle(fontSize:15)),
                        ]):AnimatedTextKit(animatedTexts: [
                          RotateAnimatedText('Make the room light up',textStyle: TextStyle(fontSize:15)),
                          RotateAnimatedText('Switch it on',textStyle: TextStyle(fontSize:15)),
                          RotateAnimatedText('turn on the lamp',textStyle: TextStyle(fontSize:15)),
                        ])),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff6076D1),
            ),
          ),
        ],
      ),
    );
  }
}

class Lamp extends StatelessWidget {
  final Color color, gradientColor;
  final bool isSwitchOn;
  final double screenHeighy, screenWidth;
  final Duration animationDuration;
  const Lamp(
      {super.key,
      required this.color,
      required this.isSwitchOn,
      required this.screenHeighy,
      required this.screenWidth,
      required this.gradientColor,
      required this.animationDuration});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //because the lamp hanger thake 0.15 of height so this must start after it
      top: screenHeighy * 0.15,
      left: -screenWidth * 0.85,
      width: screenWidth * 1.9,
      child: ClipPath(
        clipper: TrapezoidClipper(),
        child: Column(
          children: [
            Container(
              height: screenHeighy * 0.25,
              color: color,
            ),
            AnimatedContainer(
              duration: animationDuration,
              height: screenHeighy * 0.75,
              decoration: BoxDecoration(
                gradient: isSwitchOn
                    ? LinearGradient(
                        colors: [
                          gradientColor.withOpacity(0.4),
                          gradientColor.withOpacity(0.01)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //to make the slash line degree
    path.moveTo(size.width * 0.3, 0);
    //to draw the line from the top to the end
    path.lineTo(0, size.height);
    //to draw the other line from the top left to the end
    path.lineTo(size.width, size.height);
    //to make the top width line
    path.lineTo(size.width * 0.7, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldLipper) {
    return true;
  }
}
