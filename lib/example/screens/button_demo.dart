import 'package:flutter/material.dart';
import 'package:flutter_lion_components/components/lion_button.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LionPrimaryButton(
              label: "Primary Button",
              onPressed: () {},
            ),
            SizedBox(height: 16.0),
            LionSecondaryButton(
              label: "Secondary Button",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}