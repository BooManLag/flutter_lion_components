import 'package:flutter/material.dart';

class LionInput extends StatefulWidget {
  final String label;
  final String value;
  final Function(String) onChanged;
  final bool disabled;
  final String? Function(String?)? validator;

  LionInput({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.disabled = false,
    this.validator,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LionInputState createState() => _LionInputState();
}

class _LionInputState extends State<LionInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(labelText: widget.label),
      onChanged: widget.onChanged,
      enabled: !widget.disabled,
      validator: widget.validator,
    );
  }
}
