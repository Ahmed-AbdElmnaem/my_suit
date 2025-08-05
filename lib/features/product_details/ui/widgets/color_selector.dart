import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;

  const ColorSelector({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          colors.map((color) {
            return Container(
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: CircleAvatar(radius: 16, backgroundColor: color),
            );
          }).toList(),
    );
  }
}
