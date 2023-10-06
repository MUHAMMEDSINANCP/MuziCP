import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/audio_helpers/player_invoke.dart';
import 'package:music_player_app/common/color_extensions.dart';
import 'package:music_player_app/common_widget/playlist_cell.dart';
import 'package:music_player_app/common_widget/recommended_cell.dart';
import 'package:music_player_app/common_widget/songs_row.dart';
import 'package:music_player_app/common_widget/title_section.dart';
import 'package:music_player_app/common_widget/view_all_section.dart';
import 'package:music_player_app/view_model/all_songs_view_model.dart';
import 'package:music_player_app/view_model/home_view_model.dart';
import 'package:music_player_app/view_model/splash_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = Get.put(HomeViewModel());
  final allVM = Get.put(AllSongsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.find<SplashViewModel>().openDrawer();
            },
            icon: Image.asset(
              "assets/img/menu.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            )),
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: const Color(0xff292E4B),
                ),
                child: TextField(
                  controller: homeVM.txtSearch.value,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      width: 30,
                      child: Image.asset(
                        "assets/img/search.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: TColor.primaryText28,
                      ),
                    ),
                    hintText: "Search album song",
                    hintStyle: TextStyle(
                      color: TColor.primaryText28,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSection(title: "Hot Recommended"),
            SizedBox(
              height: 180,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                itemCount: homeVM.hostRecommendedArr.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var mObj = homeVM.hostRecommendedArr[index];

                  return RecommendedCell(mObj: mObj);
                },
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ViewAllSection(
              title: "Playlist",
              onPressed: () {},
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                itemCount: homeVM.playListArr.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var mObj = homeVM.playListArr[index];

                  return PlaylistCell(mObj: mObj);
                },
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ViewAllSection(
              title: "Recently Played",
              onPressed: () {},
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                vertical: 0,
              ),
              itemCount: homeVM.recentlyPlayedArr.length,
              itemBuilder: (context, index) {
                var sObj = homeVM.recentlyPlayedArr[index];

                return SongsRow(
                    sObj: sObj,
                    onPressedPlay: () {
                      playerPlayProcessDebounce(
                          homeVM.recentlyPlayedArr
                              .map((sObj) => {
                                    'id': sObj["id"].toString(),
                                    'title': sObj["name"].toString(),
                                    'artist': sObj["artists"].toString(),
                                    'album': sObj["album"].toString(),
                                    'genre': sObj["language"].toString(),
                                    'image': sObj["image"].toString(),
                                    'url': sObj["downloadUrl"].toString(),
                                    'user_id': sObj["artistsId"].toString(),
                                    'user_name': sObj["artists"].toString(),
                                  })
                              .toList(),
                          index);
                    },
                    onPressed: () {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
