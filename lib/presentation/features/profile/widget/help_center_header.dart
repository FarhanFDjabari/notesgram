import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';

class HelpCenterHeader extends StatelessWidget {
  const HelpCenterHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 144,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Resources.color.indigo50,
        image: DecorationImage(
          image: AssetImage(
            Assets.lib.theme.resources.images.helpCenterHeaderBgLayout.path,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextNunito(
            text: 'Halo, Mbak IU 👋',
            size: 18,
            fontWeight: Weightenum.BOLD,
            color: Resources.color.indigo700,
          ),
          const SizedBox(height: 8),
          TextNunito(
            text: 'Ada yang bisa kami\nbantu?',
            size: 24,
            maxLines: 2,
            fontWeight: Weightenum.BOLD,
          )
        ],
      ),
    );
  }
}
