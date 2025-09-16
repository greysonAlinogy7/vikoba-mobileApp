import 'package:flutter/material.dart';
import 'package:vikoba_mobileapp/widget/appcolor.dart';

import '../widget/background.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(painter: GridBackgroundPainter()),
            ),
            Positioned(
              left: 200,
              top: 80,
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.person),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 70,
              top: 200,
              child: Container(
                padding: EdgeInsets.all(16),
                height: 400,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "email"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "username"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "nida"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "phone"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "registration number",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "password"),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
