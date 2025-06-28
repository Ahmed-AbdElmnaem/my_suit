// lib/widgets/pickable_circle_image.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickableCircleImage extends StatefulWidget {
  final String placeholderUrl;

  final double radius;

  const PickableCircleImage({
    super.key,
    required this.placeholderUrl,
    this.radius = 60,
  });

  @override
  State<PickableCircleImage> createState() => _PickableCircleImageState();
}

class _PickableCircleImageState extends State<PickableCircleImage> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedFile;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (file != null) setState(() => _pickedFile = File(file.path));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(ImageSource.gallery),
      onLongPress: () => _pickImage(ImageSource.camera),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: widget.radius,
          backgroundImage:
              _pickedFile != null
                  ? FileImage(_pickedFile!) as ImageProvider
                  : NetworkImage(widget.placeholderUrl),
        ),
      ),
    );
  }
}
