import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';

class ProfileDrawerTile extends StatelessWidget {
  const ProfileDrawerTile({
    this.onTileTap,
    this.iconData,
    this.label,
    this.iconColor,
    this.labelColor,
    Key? key,
  }) : super(key: key);

  final Function()? onTileTap;
  final IconData? iconData;
  final String? label;
  final Color? iconColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTileTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Resources.color.indigo50,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            const SizedBox(width: 18),
            Expanded(
              child: TextNunito(
                text: label,
                size: 16,
                fontWeight: Weightenum.BOLD,
                color: labelColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
