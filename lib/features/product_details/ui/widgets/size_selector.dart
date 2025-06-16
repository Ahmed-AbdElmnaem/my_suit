import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;

  const SizeSelector({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children:
          sizes.map((size) {
            return ChoiceChip(
              label: Text(size),
              selected: false,
              onSelected: (_) {},
            );
          }).toList(),
    );
  }
}
