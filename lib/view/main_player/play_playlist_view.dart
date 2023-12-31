// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/audio_helpers/page_manager.dart';
import 'package:music_player_app/audio_helpers/service_locator.dart';
import 'package:music_player_app/common_widget/coming_soon.dart';
import 'package:music_player_app/common_widget/playlist_song_row.dart';
import 'package:music_player_app/view/main_player/driver_mode_view.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../common/color_extensions.dart';
 
class PlayPlayListView extends StatefulWidget {
  const PlayPlayListView({super.key});

  @override
  State<PlayPlayListView> createState() => _PlayPlayListViewState();
}

class _PlayPlayListViewState extends State<PlayPlayListView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    final pageManager = getIt<PageManager>();

    return Dismissible(
      key: const Key("playlistScreen"),
      direction: DismissDirection.down,
      background: const ColoredBox(color: Colors.transparent),
      onDismissed: (direction) {
        Get.back();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: TColor.bg,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            "Playlist",
            style: TextStyle(
                color: TColor.primaryText80,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            PopupMenuButton<int>(
              constraints: const BoxConstraints(
                minWidth: 130,
              ),
              color: const Color(0xff383B49),
              offset: const Offset(-10, 15),
              shadowColor: Colors.black,
              splashRadius: 5,
              elevation: 1,
              icon: Image.asset(
                "assets/img/more_btn.png",
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              onSelected: (selectIndex) {
                if (selectIndex == 2) {
                  openPlayPlaylistQueue();
                } else if (selectIndex == 1) {
                  openDriverModel();
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    onTap: () {},
                    height: 30,
                    child: const Text(
                      "Driver mode",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    height: 30,
                    child: Text(
                      "Playing Queue",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    onTap: () {
                      Get.to(() => const ComingSoon(title: "Social Share"));
                    },
                    height: 30,
                    child: const Text(
                      "Social Share",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    onTap: () {
                      Get.to(
                          () => const ComingSoon(title: "Add to playlist..."));
                    },
                    height: 30,
                    child: const Text(
                      "Add to playlist...",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 5,
                    height: 30,
                    onTap: () {
                      Get.to(() => const ComingSoon(title: "Lyrics"));
                    },
                    child: const Text(
                      "Lyrics",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 6,
                    onTap: () {
                      Get.to(() => const ComingSoon(title: "Volume"));
                    },
                    height: 30,
                    child: const Text(
                      "Volume",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 7,
                    onTap: () {
                      Get.to(() => const ComingSoon(title: "Details"));
                    },
                    height: 30,
                    child: const Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 8,
                    height: 30,
                    onTap: () {
                      Get.to(() => const ComingSoon(title: "Sleep Timer"));
                    },
                    child: const Text(
                      "Sleep Timer",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 9,
                    onTap: () {
                      Get.to(() => const ComingSoon(title: "Equaliser"));
                    },
                    height: 30,
                    child: const Text(
                      "Equaliser",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: ValueListenableBuilder<MediaItem?>(
          valueListenable: pageManager.currentSongNotifier,
          builder: (context, mediaItem, child) {
            if (mediaItem == null) return const SizedBox();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: pageManager.isFirstSongNotifier,
                        builder: (context, isFirst, child) {
                          return SizedBox(
                            width: 45,
                            height: 45,
                            child: IconButton(
                              onPressed:
                                  (isFirst) ? null : pageManager.previous,
                              icon: Image.asset(
                                "assets/img/previous_song.png",
                                color: (isFirst)
                                    ? TColor.primaryText35
                                    : TColor.primaryText,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Hero(
                            tag: "currentArtwork",
                            child: ValueListenableBuilder(
                              valueListenable: pageManager.currentSongNotifier,
                              builder: (context, value, child) {
                                return ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(media.width * 0.4),
                                  child: CachedNetworkImage(
                                    imageUrl: mediaItem.artUri.toString(),
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) {
                                      return Image.asset(
                                        "assets/img/app_logo.png",
                                        fit: BoxFit.cover,
                                      );
                                    },
                                    placeholder: (context, url) {
                                      return Image.asset(
                                        "assets/img/app_logo.png",
                                        fit: BoxFit.cover,
                                      );
                                    },
                                    width: media.width * 0.4,
                                    height: media.width * 0.4,
                                  ),
                                );
                              },
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: pageManager.progressNotifier,
                            builder: (context, valueState, child) {
                              double? dragValue;
                              bool dragging = false;

                              final value = min(
                                  valueState.current.inMilliseconds.toDouble(),
                                  valueState.total.inMilliseconds.toDouble());
                              // ignore: dead_code
                              if (dragValue != null && dragging) {
                                dragValue = null;
                              }
                              return SizedBox(
                                width: media.width * 0.41,
                                height: media.width * 0.41,
                                child: SleekCircularSlider(
                                  appearance: CircularSliderAppearance(
                                    customWidths: CustomSliderWidths(
                                      trackWidth: 2,
                                      progressBarWidth: 4,
                                      shadowWidth: 6,
                                    ),
                                    customColors: CustomSliderColors(
                                        dotColor: const Color(0xffFFB1B2),
                                        trackColor: const Color(0xffffffff)
                                            .withOpacity(0.3),
                                        progressBarColors: [
                                          const Color(0xffFB9967),
                                          const Color(0xffE9585A)
                                        ],
                                        shadowColor: const Color(0xffFFB1B2),
                                        shadowMaxOpacity: 0.05),
                                    infoProperties: InfoProperties(
                                      topLabelStyle: const TextStyle(
                                          color: Colors.transparent,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      topLabelText: 'Elapsed',
                                      bottomLabelStyle: const TextStyle(
                                          color: Colors.transparent,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      bottomLabelText: 'time',
                                      mainLabelStyle: const TextStyle(
                                          color: Colors.transparent,
                                          fontSize: 50.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    startAngle: 270,
                                    angleRange: 360,
                                    size: 350.0,
                                  ),
                                  min: 0,
                                  max: max(
                                    valueState.current.inMilliseconds
                                        .toDouble(),
                                    valueState.total.inMilliseconds.toDouble(),
                                  ),
                                  initialValue: value,
                                  onChange: (double value) {
                                    if (!dragging) {
                                      setState(() {
                                        dragging = true;
                                      });
                                    }
                                    setState(() {
                                      dragValue = value;
                                    });

                                    pageManager.seek(
                                      Duration(
                                        milliseconds: value.round(),
                                      ),
                                    );
                                  },
                                  onChangeStart: (double startValue) {},
                                  onChangeEnd: (double endValue) {
                                    pageManager.seek(
                                      Duration(
                                        milliseconds: endValue.round(),
                                      ),
                                    );
                                    dragging = false;
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: pageManager.isLastSongNotifier,
                        builder: (context, isLast, child) {
                          return SizedBox(
                            width: 45,
                            height: 45,
                            child: IconButton(
                              onPressed: (isLast) ? null : pageManager.next,
                              icon: Image.asset(
                                "assets/img/next_song.png",
                                color: (isLast)
                                    ? TColor.primaryText35
                                    : TColor.primaryText,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder(
                    valueListenable: pageManager.progressNotifier,
                    builder: (context, valueState, child) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                    .firstMatch('${valueState.current}')
                                    ?.group(1) ??
                                '${valueState.current}',
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            " | ",
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                    .firstMatch('${valueState.total}')
                                    ?.group(1) ??
                                '${valueState.total}',
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    mediaItem.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.primaryText.withOpacity(0.9),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${mediaItem.artist} • Album - ${mediaItem.album}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primaryText80,
                      fontSize: 12,
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: pageManager.playlistNotifier,
                      builder: (context, queue, _) {
                        final int queueStateIndex =
                            pageManager.currentSongNotifier.value == null
                                ? 0
                                : queue.indexOf(
                                    pageManager.currentSongNotifier.value!);
                        final num queuePosition =
                            queue.length - queueStateIndex;

                        return Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: TColor.focus,
                            shadowColor: Colors.transparent,
                          ),
                          child: ReorderableListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            itemCount: queue.length,
                            onReorder: (oldIndex, newIndex) {
                              if (oldIndex < newIndex) {
                                newIndex--;
                              }
                              pageManager.moveMediaItem(oldIndex, newIndex);
                            },
                            itemBuilder: (context, index) {
                              var sObj = queue[index];

                              return Dismissible(
                                key: ValueKey(sObj.id),
                                // ignore: unrelated_type_equality_checks
                                direction: index == queue
                                    ? DismissDirection.none
                                    : DismissDirection.horizontal,
                                onDismissed: (direction) {
                                  pageManager.removeQueueItemAt(index);
                                },
                                child: PlaylistSongRow(
                                  key: ValueKey(sObj.id),
                                  sObj: sObj,
                                  right: (index == queueStateIndex)
                                      ? Icon(
                                          Icons.bar_chart_rounded,
                                          color: TColor.primary,
                                        )
                                      : ReorderableDragStartListener(
                                          key: Key(sObj.id),
                                          enabled: index != queueStateIndex,
                                          index: index,
                                          child: Icon(
                                            Icons.drag_handle_rounded,
                                            color: TColor.primaryText,
                                          ),
                                        ),
                                  onPressed: () {
                                    pageManager.skipToQueueItem(index);
                                    if (pageManager.playButtonNotifier.value ==
                                        ButtonState.paused) {
                                      pageManager.play();
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void openPlayPlaylistQueue() {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, ___, __) => const PlayPlayListView(),
      ),
    );
  }

  void openDriverModel() {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, ___, __) => const DriverModeView(),
      ),
    );
  }
}
