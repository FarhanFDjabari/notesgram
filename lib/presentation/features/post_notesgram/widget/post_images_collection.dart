import 'package:flutter/material.dart';
import 'package:notesgram/presentation/features/post_notesgram/widget/post_image_tile.dart';

class PostImagesCollection extends StatelessWidget {
  const PostImagesCollection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        itemCount: 5,
        itemBuilder: (_, index) {
          return PostImageTile();
        },
      ),
    );
  }
}
