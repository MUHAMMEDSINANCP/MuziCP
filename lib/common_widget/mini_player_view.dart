import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/audio_helpers/page_manager.dart';
import 'package:music_player_app/common/color_extensions.dart';
import 'package:music_player_app/common_widget/control_buttons.dart';
import 'package:music_player_app/view/main_player/main_player_view.dart';
import 'dart:ui' as ui;
import '../audio_helpers/service_locator.dart';

class MiniPlayerView extends StatefulWidget {
  static const MiniPlayerView _instance = MiniPlayerView._internal();

  factory MiniPlayerView() {
    return _instance;
  }
  const MiniPlayerView._internal();

  @override
  State<MiniPlayerView> createState() => _MiniPlayerViewState();
}

class _MiniPlayerViewState extends State<MiniPlayerView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<AudioProcessingState>(
      valueListenable: pageManager.playbackStatNotifier,
      builder: (context, processingState, _) {
        if (processingState == AudioProcessingState.idle) {
          return const SizedBox();
        }
        return ValueListenableBuilder<MediaItem?>(
            valueListenable: pageManager.currentSongNotifier,
            builder: (context, mediaItem, _) {
              if (mediaItem == null) return const SizedBox();
              return Dismissible(
                key: const Key('mini_player'),
                direction: DismissDirection.down,
                onDismissed: (direction) {
                  pageManager.stop();
                },
                child: Dismissible(
                  key: Key(mediaItem.id),
                  confirmDismiss: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      pageManager.next();
                    }
                    return Future.value(false);
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                    ),
                    elevation: 0,
                    color: Colors.white10,
                    child: SizedBox(
                      height: 76.0,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(
                            sigmaX: 8.0,
                            sigmaY: 8.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: ValueListenableBuilder(
                                  valueListenable: pageManager.progressNotifier,
                                  builder: (context, value, __) {
                                    final position = value.current;
                                    final totalDuration = value.total;

                                    return position == null
                                        ? const SizedBox()
                                        : (position.inSeconds.toDouble() <
                                                    0.0 ||
                                                (position.inSeconds.toDouble() >
                                                    totalDuration.inSeconds
                                                        .toDouble()))
                                            ? const SizedBox()
                                            : SliderTheme(
                                                data: SliderThemeData(
                                                    inactiveTrackColor:
                                                        Colors.transparent,
                                                    trackHeight: 3,
                                                    thumbColor: TColor.focus,
                                                    thumbShape:
                                                        const RoundSliderOverlayShape(
                                                            overlayRadius: 1.5),
                                                    overlayColor:
                                                        Colors.transparent,
                                                    overlayShape:
                                                        const RoundSliderOverlayShape(
                                                            overlayRadius: 2.0),
                                                    activeTrackColor:
                                                        TColor.focus),
                                                child: Center(
                                                  child: Slider(
                                                    inactiveColor:
                                                        Colors.transparent,
                                                    value: position.inSeconds
                                                        .toDouble(),
                                                    max: totalDuration.inSeconds
                                                        .toDouble(),
                                                    onChanged: (newPosition) {
                                                      pageManager.seek(
                                                        Duration(
                                                          seconds: newPosition
                                                              .round(),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                  },
                                ),
                              ),
                              ListTile(
                                dense: false,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder: (_, ___, __) =>
                                          const MainPlayerView(),
                                    ),
                                  );
                                },
                                title: Text(
                                  mediaItem.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  mediaItem.artist ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: Hero(
                                  tag: 'currentArtWork',
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: SizedBox.square(
                                      dimension: 40.0,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  mediaItem.artUri.toString(),
                                              fit: BoxFit.cover,
                                              errorWidget:
                                                  (context, url, error) {
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
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: TColor.primaryText28),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: TColor.bg,
                                              borderRadius:
                                                  BorderRadius.circular(7.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                trailing: const ControllerButtons(
                                  miniPlayer: true,
                                  buttons: [
                                    'Play/Pause',
                                    'Next',
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
