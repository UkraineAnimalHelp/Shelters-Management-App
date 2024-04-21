import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uah_shelters/src/utils/image.dart';

class AvatarPicker extends StatefulWidget {
  final void Function(File file)? onPick;
  final TextEditingController? controller;

  const AvatarPicker({super.key, this.controller, this.onPick});

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  File? _image;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null && widget.controller?.value.text != "") {
      _image = File(widget.controller!.value.text);
    }
  }

  Future<void> _pickAndCropImage() async {
    final File? pickedFile =
        await ImageHelper.pickSquareFromGallery(title: "Select your photo");

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
      widget.controller!.text = pickedFile.path;
      if (widget.onPick != null && pickedFile.existsSync()) {
        widget.onPick!(pickedFile);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickAndCropImage,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.grey[300],
        backgroundImage: _image != null ? FileImage(_image!) : null,
        child: _image == null
            ? const Icon(Icons.add, size: 50, color: Colors.white)
            : null,
      ),
    );
  }
}
