import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../ThemeData/ui_kit.dart';

class YoutubeVideoItem {
  final String url;
  String title;
  YoutubeVideoItem({required this.url, this.title = 'Видео'});
}

class ProfileVideoGalleryEditor extends StatelessWidget {
  final String title;
  final List<YoutubeVideoItem> videos;
  final ValueChanged<List<YoutubeVideoItem>> onVideosChanged;

  const ProfileVideoGalleryEditor({super.key, required this.title, required this.videos, required this.onVideosChanged});

  String _getYoutubeThumbnail(String videoUrl) {
    if (videoUrl.isEmpty) return "";
    final regExp = RegExp(
      r'^.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/|shorts\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\\&\?]*).*',
      caseSensitive: false,
    );
    final match = regExp.firstMatch(videoUrl);
    return (match != null && match.groupCount >= 1) ? 'https://img.youtube.com/vi/${match.group(1)}/hqdefault.jpg' : "";
  }

  void _showAddVideoDialog(BuildContext context) {
    final urlController = TextEditingController();
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        title: "Добавить YouTube видео".body(),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppInput(controller: urlController, hint: "Ссылка на видео (YouTube)", filledStyle: true),
            SizedBox(height: 12.h),
            AppInput(controller: titleController, maxLength: 20, hint: "Название видео (до 20)", filledStyle: true),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Отмена")),
          TextButton(
            onPressed: () {
              final url = urlController.text.trim();
              var videoTitle = titleController.text.trim();
              if (url.isNotEmpty) {
                if (videoTitle.isEmpty) videoTitle = "Видео";
                onVideosChanged(List<YoutubeVideoItem>.from(videos)..add(YoutubeVideoItem(url: url, title: videoTitle)));
              }
              Navigator.pop(ctx);
            },
            child: const Text("ОК", style: TextStyle(color: AppColors.accentPink)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.body(weight: FontWeight.w500, size: 16.sp),
          SizedBox(height: 15.h),
          SizedBox(
            height: 140.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: videos.length + 1,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () => _showAddVideoDialog(context),
                    child: Container(
                      width: 150.w, height: 110.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), border: Border.all(color: AppColors.surfaceBorder), color: Colors.white.withOpacity(0.04)),
                      child: const Icon(Icons.add_circle_outline, color: Colors.white60, size: 32),
                    ),
                  );
                }

                final item = videos[index - 1];
                final thumb = _getYoutubeThumbnail(item.url);

                return Stack(
                  children: [
                    Container(
                      width: 180.w,
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.02), borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: AppImg(thumb, width: 180, height: 100, radius: 0),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: item.title.body(size: 11.sp, maxLines: 1, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 4.h, right: 4.w,
                      child: GestureDetector(
                        onTap: () => onVideosChanged(List<YoutubeVideoItem>.from(videos)..removeAt(index - 1)),
                        child: Container(
                          padding: EdgeInsets.all(4.w), decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                          child: const Icon(Icons.close, size: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}