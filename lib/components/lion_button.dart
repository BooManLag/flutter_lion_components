import 'package:flutter/material.dart';

class LionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool disabled;

  const LionButton(
      {super.key, required this.label, required this.onPressed, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      child: Text(label),
    );
  }
}
