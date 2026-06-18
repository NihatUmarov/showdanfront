import '../AppLanguage.dart';

enum MusicArtistType {
  coverBand(
  });

  final int id;
  final Map<String, String> localization;

  const MusicEquipmentRider(this.id, this.localization);

  String get label => localization[LangController.current.id] ?? localization['en'] ?? id.toString();

  static MusicEquipmentRider? fromId(int? id) =>
      MusicEquipmentRider.values.cast<MusicEquipmentRider?>().firstWhere((e) => e?.id == id, orElse: () => null);
}