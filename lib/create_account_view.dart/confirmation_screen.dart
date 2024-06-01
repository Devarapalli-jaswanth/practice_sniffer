import 'package:flutter/material.dart';
import 'package:gemini_project/login_view.dart/login_page.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          // Left section with background image and text
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('images/891.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Successfully New Account\nCreated One for You.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Right section with success message
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/6655.png',
                      width: 350,
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'You successfully created your new account,\nSTART YOUR JOURNEY IN OUR APP!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                      child: const Text(
                        'Back to Login Screen',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
