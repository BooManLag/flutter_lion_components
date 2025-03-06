import 'package:flutter/material.dart';

/// TODO: Add more button variations (e.g., danger button, icon button)
/// TODO: Implement animations (e.g., ripple effect, hover state changes)
/// TODO: Add a loading state (e.g., spinner on click)

/// Base button class for Lion components, enabling easy extension.
/// This class defines shared button properties and styling.
abstract class _BaseLionButton extends StatelessWidget {
  /// The text label displayed on the button.
  final String label;

  /// The callback function triggered when the button is pressed.
  final VoidCallback onPressed;

  /// Whether the button is disabled.
  final bool disabled;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The text color of the button label.
  final Color? textColor;

  /// The border radius for rounded corners.
  final double borderRadius;

  /// The elevation (shadow) level of the button.
  final double elevation;

  /// Padding inside the button.
  final EdgeInsetsGeometry padding;

  /// Focus node for managing focus state.
  final FocusNode? focusNode;

  /// Semantic label for screen readers (accessibility).
  final String? semanticLabel;

  const _BaseLionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8.0,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.focusNode,
    this.semanticLabel,
  });

  ButtonStyle _buildStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      foregroundColor: textColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
      padding: padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel ?? label,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        focusNode: focusNode,
        style: _buildStyle(context),
        child: Text(
          label,
          style: TextStyle(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}

/// Primary button variation with default primary color.
class LionPrimaryButton extends _BaseLionButton {
  const LionPrimaryButton({
    super.key,
    required super.label,
    required super.onPressed,
    super.disabled,
    super.borderRadius,
    super.elevation,
    super.padding,
    super.focusNode,
    super.semanticLabel,
  }) : super(backgroundColor: Colors.blue, textColor: Colors.white);
}

/// Secondary button variation with an outlined style.
class LionSecondaryButton extends _BaseLionButton {
  const LionSecondaryButton({
    super.key,
    required super.label,
    required super.onPressed,
    super.disabled,
    super.borderRadius,
    super.elevation,
    super.padding,
    super.focusNode,
    super.semanticLabel,
  }) : super(backgroundColor: Colors.white, textColor: Colors.blue);
}
