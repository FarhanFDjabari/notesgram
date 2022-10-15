import 'package:flutter/material.dart';
import 'package:notesgram/theme/resources.dart';

class ActionMenuBottomSheet extends StatelessWidget {
  const ActionMenuBottomSheet({
    required this.menuItems,
    Key? key,
  }) : super(key: key);

  final List<ListTile> menuItems;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Resources.color.neutral50,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                menuItems.length,
                (index) {
                  return menuItems[index];
                },
                growable: true,
              ),
            ),
          ],
        ));
  }
}
