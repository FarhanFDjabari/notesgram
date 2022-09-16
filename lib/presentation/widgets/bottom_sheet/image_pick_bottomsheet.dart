import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';

class ImagePickBottomSheet extends StatefulWidget {
  final Function(File?) pickCallback;

  ImagePickBottomSheet({
    required this.pickCallback,
  });

  @override
  State<StatefulWidget> createState() {
    return _ImagePickBottomSheetState();
  }
}

class _ImagePickBottomSheetState extends State<ImagePickBottomSheet> {
  bool _isPickingImage = false;
  File? pickedImage;

  Future<void> _onPickImage(ImageSource source) async {
    if (_isPickingImage) return;
    _isPickingImage = true;
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: source,
      imageQuality: 50,
    );
    _isPickingImage = false;
    if (null != pickedFile) {
      if (kIsWeb) {
        await pickedFile.readAsBytes();
      } else {
        // Warning:  this will not work on the web platform because pickedFile
        // will instead point to a network resource.
        final imageFile = File(pickedFile.path);
        // assert(null != imageFile);
        pickedImage = imageFile;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Resources.color.neutral50,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 4,
              width: 64,
              decoration: BoxDecoration(
                color: Resources.color.neutral300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              onTap: () async {
                await _onPickImage(ImageSource.camera);
                widget.pickCallback(pickedImage);
              },
              title: TextNunito(
                text: 'Ambil gambar',
                size: 16,
                fontWeight: Weightenum.BOLD,
                color: Resources.color.neutral900,
              ),
              trailing: const Icon(
                Remix.camera_line,
                size: 24,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              onTap: () async {
                await _onPickImage(ImageSource.gallery);
                widget.pickCallback(pickedImage);
              },
              title: TextNunito(
                text: 'Pilih dari galeri',
                size: 16,
                fontWeight: Weightenum.BOLD,
                color: Resources.color.neutral900,
              ),
              trailing: const Icon(
                Remix.image_2_line,
                size: 24,
              ),
            ),
          ],
        ));
  }
}
