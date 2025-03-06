import 'package:flutter/material.dart';

/// A customizable text input field inspired by Lion Web Components.
/// Provides accessibility, theming, and configurable styles for developers.
/// TODO: Add support for suffix icons (e.g., clear or visibility toggle for passwords)
/// TODO: Implement dynamic styling based on focus/validation states
/// TODO: Add a loading indicator (e.g., for async validation)
/// TODO: Allow multiline input for text areas
class LionInput extends StatefulWidget {
  /// The label displayed above the input field.
  final String label;

  /// The initial value of the input field.
  final String value;

  /// Callback function triggered when the input value changes.
  final Function(String) onChanged;

  /// Whether the input field is disabled.
  final bool disabled;

  /// Validator function for form validation.
  final String? Function(String?)? validator;

  /// Placeholder text for the input field.
  final String? placeholder;

  /// Maximum number of characters allowed.
  final int? maxLength;

  /// Controls if the input is obscured (for passwords).
  final bool obscureText;

  /// Icon displayed inside the input field (prefix icon).
  final IconData? prefixIcon;

  /// Semantic label for screen readers (accessibility support).
  final String? semanticLabel;

  const LionInput({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.disabled = false,
    this.validator,
    this.placeholder,
    this.maxLength,
    this.obscureText = false,
    this.prefixIcon,
    this.semanticLabel,
  });

  @override
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
    return Semantics(
      label: widget.semanticLabel ?? widget.label,
      textField: true,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.placeholder,
          prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: widget.onChanged,
        enabled: !widget.disabled,
        validator: widget.validator,
        maxLength: widget.maxLength,
        obscureText: widget.obscureText,
      ),
    );
  }
}