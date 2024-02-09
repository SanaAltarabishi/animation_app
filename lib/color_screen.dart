import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  late List<AnimatedColorsExample> _example;
  int _index = 0;
  int _tapCount = 0;

  void initState() {
    super.initState();
    _example = animatedColorsExample(onTap: () {
      print('event');
      setState(() {
        _tapCount++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final animatedColorsExample = _example[_index];
    return Scaffold(
      backgroundColor: Color(0xffD6E2EA),
      appBar: AppBar(
        backgroundColor: Color(0xff6076D1),
        title: Text(
          //حط شي ثابت متل انوا تعلم الالوان
          animatedColorsExample.lable,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //! why this ??
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Center(
            key: ValueKey(
              animatedColorsExample.lable,
            ),
            child: animatedColorsExample.child,
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6076D1),
        onPressed: () {
          setState(() {
            _index = ++_index % _example.length;
            //!why i will use this line
            _tapCount = 0;
          });
        },
        tooltip: 'Next',
        child: Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}

class AnimatedColorsExample {
  final String lable;
  final Color? color;
  final Widget child;
  const AnimatedColorsExample({
    required this.lable,
    required this.color,
    required this.child,
  });
}

const _colorizeTextStyle = TextStyle(
  fontSize: 50,
  fontFamily: 'Horizon',
);

const _colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

List<AnimatedColorsExample> animatedColorsExample({VoidCallback? onTap}) =>
    <AnimatedColorsExample>[
      AnimatedColorsExample(
        lable: 'Purple',
        color: Colors.purple,
        child: TextLiquidFill(
          text: "Purple",
          waveColor: Colors.purple,
          boxBackgroundColor: Color(0xffD6E2EA),
          textStyle: TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300,
        ),
      ),
      AnimatedColorsExample(
        lable: 'blue',
        color: Colors.blue,
        child: TextLiquidFill(
          text: "blue",
          waveColor: Colors.blue,
          boxBackgroundColor: Color(0xffD6E2EA),
          textStyle: TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300,
        ),
      ),
      AnimatedColorsExample(
        lable: 'pink',
        color: Colors.pink,
        child: TextLiquidFill(
          text: "pink",
          waveColor: Colors.pink,
          boxBackgroundColor: Color(0xffD6E2EA),
          textStyle: TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300,
        ),
      ),
      AnimatedColorsExample(
        lable: 'green',
        color: Colors.green,
        child: TextLiquidFill(
          text: "green",
          waveColor: Colors.green,
          boxBackgroundColor: Color(0xffD6E2EA),
          textStyle: TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300,
        ),
      ),
      AnimatedColorsExample(
        lable: 'Yellow',
        color: Colors.yellow,
        child: TextLiquidFill(
          text: "Yellow",
          waveColor: Colors.yellow,
          boxBackgroundColor: Color(0xffD6E2EA),
          textStyle: TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300,
        ),
      ),
      AnimatedColorsExample(
          lable: 'multi colors',
          color: Color(0xffD6E2EA),
          child: AnimatedTextKit(animatedTexts: [
            ColorizeAnimatedText('multi colors',
                textStyle: _colorizeTextStyle, colors: _colorizeColors)
          ]))
    ];
