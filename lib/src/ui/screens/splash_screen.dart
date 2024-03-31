import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double imageWidth = screenWidth * 0.5;
    if (screenWidth > screenHeight) {
      imageWidth = screenHeight * 0.5;
    }
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Use min to wrap content in the column
            children: [
              SvgPicture.asset(
                  'assets/logo.svg', width: imageWidth), // Replace with your logo path
              const SizedBox(
                  height: 20), // Add some spacing between the logo and the text
              const Text(
                "Ukraine Animal Help", // Your text goes here
                style: TextStyle(
                  fontSize: 24, // Set your desired font size
                  color: Colors.white, // Set your desired text color
                  fontWeight: FontWeight.bold, // Optional: Set font weight
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
