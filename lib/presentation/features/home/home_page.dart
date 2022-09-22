import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/features/home/controller/home_controller.dart';
import 'package:notesgram/presentation/features/home/user_post_fragment.dart';
import 'package:notesgram/presentation/features/home/widget/colored_tab_bar.dart';
import 'package:notesgram/presentation/features/home/widget/home_topup_tile.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
        bottom: ColoredTabBar(
          color: Resources.color.neutral50,
          tabBar: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                key: ValueKey('following_tab'),
                text: 'Following',
              ),
              Tab(
                key: ValueKey('for_you_tab'),
                text: 'For You',
              ),
            ],
            labelStyle: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            labelColor: Resources.color.indigo900,
            unselectedLabelColor: Resources.color.neutral400,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Resources.color.indigo700,
            indicatorWeight: 2,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 8,
            color: Resources.color.neutral100,
          ),
          GetX<HomeController>(
            init: HomeController(),
            initState: (_) {},
            builder: (controller) {
              return HomeTopUpTile(
                coinAmount: controller.totalCoin.value,
                onTopUpPressed: () {
                  controller.goToTopUp();
                },
              );
            },
          ),
          Container(
            height: 8,
            color: Resources.color.neutral100,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                UserPostFragment(),
                UserPostFragment(),
              ],
            ),
          ),
          Container(
            height: 8,
            color: Resources.color.neutral100,
          ),
        ],
      ),
    );
  }
}
