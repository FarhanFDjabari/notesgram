import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/controller/home_controller.dart';
import 'package:notesgram/presentation/features/home/widget/home_post_tile.dart';
import 'package:notesgram/presentation/features/home/widget/home_topup_tile.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Assets.lib.theme.resources.images.appLogoMonochrome.image(
          width: 32,
          height: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Remix.menu_line,
              color: Resources.color.neutral50,
            ),
            iconSize: 20,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTopUpTile(
            coinAmount: '100.000',
            onTopUpPressed: () {},
          ),
          Container(
            height: 8,
            color: Resources.color.indigo50,
          ),
          Expanded(
            child: SizedBox(
              width: SizerUtil.width,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return HomePostTile();
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 8,
                    color: Resources.color.indigo50,
                  );
                },
                itemCount: 2,
              ),
            ),
          ),
          Container(
            height: 8,
            color: Resources.color.indigo50,
          ),
        ],
      ),
    );
  }
}
