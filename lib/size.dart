import 'package:flutter/material.dart';

class SizedPage extends StatefulWidget {
  const SizedPage({super.key});

  @override
  State<SizedPage> createState() => _SizedPageState();
}

class _SizedPageState extends State<SizedPage> {
  double _containerSize = 100.0;
  bool _isExpanded = false;

  void _toggleContainerSize() {
    setState(() {
      _isExpanded = !_isExpanded;
      _containerSize = _isExpanded ? 400.0 : 200.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xffD6E2EA),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff6076D1),
        title: Text(
          'Size',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: _containerSize,
          height: _containerSize,
          color: Color(0xff6076D1),
          child:Center(child: Text(_isExpanded?'make me smaller':'make me bigger',style: TextStyle(fontWeight: FontWeight.bold),),),
        ),
      ),
            floatingActionButton: FloatingActionButton(
              backgroundColor:  Color(0xff6076D1),
        onPressed: _toggleContainerSize,
        child: Icon(_isExpanded ? Icons.remove : Icons.add),
      ),
    );
  }
}