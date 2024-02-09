import 'package:flutter/material.dart';

class DirectionPage extends StatefulWidget {
  const DirectionPage({super.key});

  @override
  State<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  bool _isMoved = false;

  void _position() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffD6E2EA),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff6076D1),
        title: Text(
          'UP & Down',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: _isMoved ? 200 : screenHeight * 0.01,
            left: _isMoved ? 200 : screenWidth * 0.4,
            child: Icon(
              Icons.star_sharp,
              size: 120,
              color: Color(0xff6076D1),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.2,
            left: screenWidth * 0.35,
            child: TextButton(
            
              onPressed:_position,
              child:Text(
              _isMoved ? 'Move me up' : 'Move me down',style: TextStyle(color: Color(0xff6076D1),fontSize:20,fontWeight: FontWeight.bold ),
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff6076D1),
          tooltip: 'Left & right',
          child: Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder:(context) => RightPage(),),);
          }),
    );
  }
}

class RightPage extends StatefulWidget {
  const RightPage({super.key});

  @override
  State<RightPage> createState() => _RightPageState();
}

class _RightPageState extends State<RightPage> {
  bool _Moved = false;

  void _position() {
    setState(() {
      _Moved = !_Moved;
    });
  }


  @override
  Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffD6E2EA),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff6076D1),
        title: Text(
          'Left & right',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: _Moved ? 200 : screenHeight * 0.3,
            left: _Moved ? 200 : 0.0,
            child: Icon(
              Icons.star_sharp,
              size: 120,
              color: Color(0xff6076D1),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.2,
            left: screenWidth * 0.3,
            child: TextButton(
            
              onPressed:_position,
              child:Text(
              _Moved ? ' Move me to the left' : 'Move me to the right ',style: TextStyle(color: Color(0xff6076D1),fontSize:20,fontWeight: FontWeight.bold ),
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff6076D1),
          tooltip: 'Up & Down',
          child: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {Navigator.pop(context);}),
    ); 
  }
}