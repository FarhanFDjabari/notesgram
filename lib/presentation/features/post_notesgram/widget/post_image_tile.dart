import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:remixicon/remixicon.dart';

class PostImageTile extends StatelessWidget {
  const PostImageTile({
    required this.itemData,
    required this.onItemDelete,
    Key? key,
  }) : super(key: key);

  final Function(File) onItemDelete;
  final File itemData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Resources.color.indigo500,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: FileImage(itemData),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: InkWell(
              onTap: () {
                onItemDelete(itemData);
              },
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Resources.color.neutral600,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Remix.close_line,
                  size: 16,
                  color: Resources.color.neutral50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
