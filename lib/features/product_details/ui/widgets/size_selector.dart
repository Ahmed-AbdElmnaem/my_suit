import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizes;
  final Function(String) onSizeSelected;
  final String? selectedSize;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
    this.selectedSize,
  });

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedSize;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children:
          widget.sizes.map((size) {
            final isSelected = _selected == size;

            return ChoiceChip(
              label: Text(size),
              selected: isSelected,
              selectedColor: Colors.black,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              onSelected: (_) {
                setState(() => _selected = size);
                widget.onSizeSelected(size);
              },
            );
          }).toList(),
    );
  }
}
