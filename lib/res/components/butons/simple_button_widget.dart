import 'package:flutter/material.dart';

class SimpleButtonWidget extends StatelessWidget {
  const SimpleButtonWidget({
    super.key,
    required this.label,
    required this.onPress,
    this.width,
    this.height,
    this.radius = 8,
    this.bgColor = Colors.green,
    this.fgColor = Colors.white,
  });

  final String label;
  final VoidCallback onPress;
  final double? width;
  final double? height;
  final double? radius;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
          backgroundColor: bgColor,
          foregroundColor: fgColor,
        ),
        child: Text(label),
      ),
    );
  }
}
