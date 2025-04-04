import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/Gradientbackground.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

// creating statefullWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  //variables for the colors since i need to print the values
  late int red, green, blue;
  // variables for the alignments since i need to 4 specific alignments in order i needed to create variables so i pass them for better manage
  late Alignment gradientbegin, gradientend;
  late String key; //the current direction

  /*
    created Map to save the direction as a list since Alignment have multiple options
    I need for every direction a specific options to apply so the best way to manage
    and save them was map for a key with the specific direction.
  */
  final Map<String, List<Alignment>> directions = {
    "Vertical": [Alignment.centerLeft, Alignment.centerRight],
    "Horizontal": [Alignment.topCenter, Alignment.bottomCenter],
    "Left-Right": [Alignment.topLeft, Alignment.bottomRight],
    "Right-Left": [Alignment.bottomLeft, Alignment.topRight],
  };

  int directioncount =
      0; //count to loop through the keys to know i finished the all directions option and need to restart from the first

  // get random int for the colors
  static int getrandomvalue() => Random().nextInt(256);

  @override
  void initState() {
    // Intiailization at start of the app
    super.initState();
    _initializeColors();
    changedirection();
  }

  // SetState for the colors and directions to actually update in screen
  void _initializeColors() {
    setState(() {
      red = getrandomvalue();
      green = getrandomvalue();
      blue = getrandomvalue();
    });
  }

  void changedirection() {
    setState(() {
      List<String> keys = directions.keys.toList();
      key = keys[directioncount];

      // Get the alignment pair (List<Alignment>) for the key
      List<Alignment> align =
          directions[key] ??
          directions["Vertical"]!; // Default to "Horizontal" if not found

      // Update the gradient begin and end values
      gradientbegin = align[0];
      gradientend = align[1];

      // Update the directioncount to cycle through the directions
      directioncount = (directioncount + 1) % keys.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Gradientbackground(
            colors: [
              Color.fromARGB(255, red, green, blue),
              Color.fromARGB(130, 180, 180, 180),
              Color.fromARGB(255, red, green, blue),
            ],
            begin: gradientbegin,
            end: gradientend,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: _initializeColors,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                  child: const Text(
                    "change Colors",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "red= $red ,green= $green ,blue= $blue",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: changedirection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                  child: const Text(
                    "change Directions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Direction: $key",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
