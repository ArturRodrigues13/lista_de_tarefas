import 'package:flutter/material.dart';

class Scale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double scale;

  const Scale({
    super.key,
    required this.child,
    this.onPressed,
    this.scale = 1.1
    });

  @override
  State<Scale> createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<Scale> {
  bool _isHovered = false;
  bool _isPressed = false;

  double get _currentScale {
    if (_isPressed) return widget.scale;
    if (_isHovered) return widget.scale;
    return 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: _currentScale,
          duration: const Duration(milliseconds: 150),
          child: widget.child,
        ),
      )
    );
  }
}
