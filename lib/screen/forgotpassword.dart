import 'package:flutter/material.dart';

import '../widget/background.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[50], // Light tint for grid contrast

      body: Stack(
        children: [
          // Full-screen grid background
          SizedBox.expand(child: CustomPaint(painter: GridBackgroundPainter())),
          // Content overlay
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 50.0, color: Colors.grey),
                const SizedBox(height: 20.0),
                const Text(
                  'No worries, we\'ll send you reset instructions.',
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF616161)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Add password reset logic here
                    print('Reset password for ${_emailController.text}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Reset password'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
