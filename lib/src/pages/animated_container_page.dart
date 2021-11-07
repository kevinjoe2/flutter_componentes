import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {

  AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.cyan;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.elasticInOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _cambiarForma(),
        child: Icon( Icons.play_arrow_rounded ),
      ),
    );
  }

  _cambiarForma() {
    
    setState(() {
      _width = numeroRandom(20,300).toDouble();
      _height = numeroRandom((_width.toInt()+1),300).toDouble();
      _color = Color.fromRGBO(
        numeroRandom(1,255), 
        numeroRandom(1,255), 
        numeroRandom(1,255), 
        1
      );
      _borderRadius = BorderRadius.circular(numeroRandom(20,100).toDouble());  
    });
  }

  int numeroRandom(int min, int max) => min + _random.nextInt(max - min);
}