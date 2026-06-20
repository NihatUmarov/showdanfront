import 'dart:io';
import 'package:intl/intl.dart';
import '../../Screens/ProfileScreen/widgets/EditProfile/ProfileVideoGalleryEditor.dart';
import '../../widgets/ImageEditHelper.dart';

class PricePack {
  factory MediaItem.fromJson(Map<String, dynamic> json, {String defaultTitle = ''}) {
    return MediaItem(
      url: json['url']?.toString() ?? '',
      title: json['ttl']?.toString() ?? defaultTitle,
    );
  }

  Map<String, dynamic> toJson() => {'url': url, 'ttl': title};
}

class PerformerFullProfileModel {
  final int serviceId;
  final String displayName;
  final String? avatarUrl;
  final int age;
  final String? dsn;
  final double? latitude;
  final double? longitude;
  final List<int> genreCodes;
  final List<int> specializationCodes;
  final List<int> attributeCodes;
  final String? parameterRange;

  PerformerFullProfileModel({
      genreCodes: (json['gn_c'] as List? ?? []).cast<int>(),
      specializationCodes: (json['tp_c'] as List? ?? []).cast<int>(),
      attributeCodes: (json['ex_c'] as List? ?? []).cast<int>(),
      parameterRange: json['parm'],
    );
  }
}

class ProfileDraft {
  int? categoryId;
  String? avatarPath;
  String? name;
  String? lastName;
  List<GalleryImage> serverRegularPhotosWithMeta = [];
  List<GalleryImage> serverWorkPhotosWithMeta = [];
  List<YoutubeVideoItem> serverVideosWithMeta = [];
  int cityId;
  String? licensePath;
  String selectedCurrencyId;
  List<int> genreCodes = [];
  List<int> specializationCodes = [];
  List<int> attributeCodes = [];
  String? parameterRange;,
      attributeCodes: (json['ex_c'] as List? ?? []).cast<int>(
      'wk_o': workStyleOptionally,
      'l_com': communicationLanguages,
      'l_wrk': workLanguages,
      'cur': selectedCurrencyId.isNotEmpty ? selectedCurrencyId : curr
  List<MediaItem> get videosOrEmpty => this?.videos ?? [];
}

extension ProfileDraftGalleryX on ProfileDraft {
  List<GalleryImage> toRegularGalleryImages() => _mapPathsToGallery(regularPhotoPaths, newPersonalPhotoTitles);
  List<GalleryImage> toWorkGalleryImages() => _mapPathsToGallery(workPhotoPaths, newLivePhotoTitles);

  List<GalleryImage> _mapPathsToGallery(List<String> paths, List<String> titles) {
    return List.generate(paths.length, (i) => paths[i].startsWith('http')
        ? GalleryImage(url: paths[i], description: i < titles.length ? titles[i] : '')
        : GalleryImage(file: File(paths[i]), description: i < titles.length ? titles[i] : ''));
  }
}п