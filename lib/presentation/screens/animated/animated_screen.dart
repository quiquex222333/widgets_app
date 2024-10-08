import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  final int maxRGBValue = 255;
  final int maxWidthSize = 300;
  final int maxHeightSize = 300;
  final int maxBorderRadius = 100;

  void changeShape() {
    final random = Random();
    width = random.nextInt(maxWidthSize) + 50;
    height = random.nextInt(maxHeightSize) + 50;
    borderRadius = random.nextInt(maxBorderRadius) + 10;
    color = Color.fromRGBO(
      random.nextInt(maxRGBValue),
      random.nextInt(maxRGBValue),
      random.nextInt(maxRGBValue),
      1,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animaed Container"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_outlined),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              borderRadius < 0 ? 0 : borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
