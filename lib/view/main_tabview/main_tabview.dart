import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/common/color_extensions.dart';
 import 'package:music_player_app/common_widget/icon_text_row.dart';
import 'package:music_player_app/common_widget/mini_player_view.dart';
import 'package:music_player_app/view/home/home_view.dart';
import 'package:music_player_app/view/settings/settings_view.dart';
import 'package:music_player_app/view/songs/songs_view.dart';
import 'package:music_player_app/view_model/splash_view_model.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);

    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
     super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var splashVM = Get.find<SplashViewModel>();

    return Scaffold(
      key: splashVM.scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color(0xff10121D),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 240,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: TColor.primaryText.withOpacity(
                    0.03,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/img/app_logo.png",
                      width: media.width * 0.17,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "328\nSongs",
                              style: TextStyle(
                                  color: Color(0xffC1C0C0), fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "52\nAlbums",
                              style: TextStyle(
                                  color: Color(0xffC1C0C0), fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "58\nArtists",
                              style: TextStyle(
                                  color: Color(0xffC1C0C0), fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            IconTextRow(
              title: "Themes",
              optionalHeightforTiles: 50,
              icon: "assets/img/m_theme.png",
              onTap: () {
                splashVM.closeDrawer();
              },
            ),
            IconTextRow(
              title: "Ringtone Cutter",
              optionalHeightforTiles: 50,
              icon: "assets/img/m_ring_cut.png",
              onTap: () {
                splashVM.closeDrawer();
              },
            ),
            IconTextRow(
              title: "Sleep Timer",
              optionalHeightforTiles: 50,
              icon: "assets/img/m_sleep_timer.png",
              onTap: () {
                splashVM.closeDrawer();
              },
            ),
            IconTextRow(
              title: "Equliser",
              optionalHeightforTiles: 50,
              icon: "assets/img/m_eq.png",
              onTap: () {
                splashVM.closeDrawer();
              },
            ),
            IconTextRow(
              title: "Driver Mode",
              optionalHeightforTiles: 50,
              icon: "assets/img/m_driver_mode.png",
              onTap: () {
                splashVM.closeDrawer();
              },
            ),
            IconTextRow(
              title: "Hidden Folders",
              optionalHeightforTiles: 50,
              icon: "assets/img/m_hidden_folder.png",
              onTap: () {
                splashVM.closeDrawer();
              },
            ),
            IconTextRow(
              title: "Scan Media",
              optionalHeightforTiles: 50,
              icon: "assets/img/m_scan_media.png",
              onTap: () {
                splashVM.closeDrawer();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: controller,
            children: const [HomeView(), SongsView(), SettingsView()],
          ),
          MiniPlayerView(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: TColor.bg,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            labelColor: TColor.primary,
            labelStyle: const TextStyle(fontSize: 10),
            unselectedLabelColor: TColor.primaryText28,
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            tabs: [
              Tab(
                text: "Home",
                icon: Image.asset(
                  selectTab == 0
                      ? "assets/img/home_tab.png"
                      : "assets/img/home_tab_un.png",
                  width: 20,
                  height: 20,
                ),
              ),
              Tab(
                text: "Songs",
                icon: Image.asset(
                  selectTab == 1
                      ? "assets/img/songs_tab.png"
                      : "assets/img/songs_tab_un.png",
                  width: 20,
                  height: 20,
                ),
              ),
              Tab(
                text: "Settings",
                icon: Image.asset(
                  selectTab == 2
                      ? "assets/img/setting_tab.png"
                      : "assets/img/setting_tab_un.png",
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
