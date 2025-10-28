import 'package:flutter/material.dart';

class ColorDisplay extends StatelessWidget {
  const ColorDisplay({
    super.key,
    required this.selectedColor,
    required this.isCircular,
  });

  final Color selectedColor;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final containerSize = deviceSize.shortestSide * 0.6;
    debugPrint('Device Size: $deviceSize');
    debugPrint('Container Size: $containerSize');
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: selectedColor,
        borderRadius: BorderRadius.circular(
          isCircular ? containerSize / 2 : 10,
        ),
        boxShadow: [
          BoxShadow(
            color: selectedColor.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
