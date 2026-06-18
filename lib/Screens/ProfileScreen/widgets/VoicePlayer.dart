import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioCardStyle {
  static final BoxDecoration containerDecoration = BoxDecoration(
    color: const Color(0xFF25222E),
    borderRadius: BorderRadius.circular(16.r),
    border: Border.all(
      color: Colors.white.withOpacity(0.08),
      width: 1,
    ),
  );
}

class VoicePlayerController extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();

  int? _playingIndex;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  int? get playingIndex => _playingIndex;

  double get progress {
    if (_duration.inMilliseconds > 0) {
      return (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0);
    }
    return 0.0;
  }

  String get durationText {
    final minutes = _duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = _duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  VoicePlayerController() {
    _player.onPositionChanged.listen((p) {
      _position = p;
      notifyListeners();
    });
    _player.onDurationChanged.listen((d) {
      _duration = d;
      notifyListeners();
    });
    _player.onPlayerComplete.listen((_) {
      _playingIndex = null;
      _position = Duration.zero;
      notifyListeners();
    });
  }

  Future<void> togglePlay(int index, String sourcePath, {bool isRemote = true}) async {
    if (_playingIndex == index) {
      await _player.stop();
      _playingIndex = null;
      _position = Duration.zero;
    } else {
      await _player.stop();
      _playingIndex = index;
      _position = Duration.zero;

      Source source = isRemote ? UrlSource(sourcePath) : DeviceFileSource(sourcePath);
      await _player.play(source);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

class VoicePlayerWidget extends StatelessWidget {
  final VoicePlayerController controller;
  final int index;
  final String audioUrl;
  final String title;

  const VoicePlayerWidget({
    super.key,
    required this.controller,
    required this.index,
    required this.audioUrl,
    required this.title,
  });

  static const _wave = [
    0.45, 0.65, 0.82, 0.58, 0.90, 0.72, 0.40, 0.65, 0.85, 0.55,
    0.35, 0.22, 0.28, 0.35, 0.25, 0.20, 0.55, 0.78, 0.40, 0.72,
    0.15, 0.95, 0.65, 0.22, 0.40, 0.55, 0.72, 0.88
  ];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final isPlaying = controller.playingIndex == index;
        final progress = isPlaying ? controller.progress : 0.0;
        final duration = isPlaying ? controller.durationText : '00:00';

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          decoration: AudioCardStyle.containerDecoration,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => controller.togglePlay(index, audioUrl, isRemote: false),
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFE24BFF), Color(0xFFFF8A72)],
                    ),
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 20.w,
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(_wave.length, (i) {
                          final active = i / _wave.length <= progress;
                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                              child: FractionallySizedBox(
                                heightFactor: _wave[i],
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: active
                                        ? const Color(0xFFFF8A72)
                                        : Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          duration,
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}