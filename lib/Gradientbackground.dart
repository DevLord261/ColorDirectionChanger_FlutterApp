import 'package:flutter/material.dart';

// i took the class we made in the session and have some changes on it take pass the colors and alignment parameters
class Gradientbackground extends StatelessWidget {
  late List<Color> colors;
  late Alignment begin, end;
  Gradientbackground({
    super.key,
    required this.colors,
    required this.begin,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors, begin: begin, end: end),
      ),
    );
  }
}
