import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/post_notesgram/controller/post_notesgram_controller.dart';
import 'package:notesgram/presentation/features/post_notesgram/widget/post_image_tile.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:remixicon/remixicon.dart';

class PostImagesCollection extends GetView<PostNotesgramController> {
  const PostImagesCollection({
    required this.onItemDelete,
    Key? key,
  }) : super(key: key);

  final Function(File) onItemDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      child: GetX<PostNotesgramController>(
        init: PostNotesgramController(),
        initState: (_) {},
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            itemCount: controller.images.length + 1,
            itemBuilder: (_, index) {
              if (index == controller.images.length) {
                return InkWell(
                  onTap: () {
                    controller.showPostBottomSheet();
                  },
                  child: SizedBox(
                    height: 110,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Resources.color.neutral300,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Icon(
                              Remix.add_line,
                              size: 28,
                              color: Resources.color.neutral400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return PostImageTile(
                itemData: controller.images[index],
                onItemDelete: onItemDelete,
              );
            },
          );
        },
      ),
    );
  }
}
