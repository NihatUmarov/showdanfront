import '../AppLanguage.dart';

/// 1. ПРИНЦИП РАБОТЫ ДИДЖЕЯ (Начинаем с ID = 1)
enum DjWorkStyle {
  strict(
      1,.current.id] ?? localizationTitle['en'] ?? id.toString();
  String get description => localizationDesc[LangController.current.id] ?? localizationDesc['en'] ?? '';

  static DjWorkStyle fromId(int? id) =>
      DjWorkStyle.values.firstWhere((e) => e.id == id, orElse: () => DjWorkStyle.flexible);
}

/// 2. ОБОРУДОВАНИЕ ДИДЖЕЯ (Начинаем с ID = 1)
enum DjEquipment {
  vinyl(3, {
    'ru': 'Винил (Особый статус)',
    'en': 'Vinyl (Special status)',
      DjEquipment.values.cast<DjEquipment?>().firstWhere((e) => e?.id == id, orElse: () => null);
}

/// 3. ТИП ДИДЖЕЯ / СПЕЦИАЛИЗАЦИЯ (Начинаем с ID = 1)
enum DjType {
  weddingEvent(1,
      {'ru': 'Свадебный / Эвент DJ', 'en': 'Weddinловых пластинках.', 'en': 'Exclusive performance on vinyl records only.', 'uz': 'Faqat vinil plastinkalarida eksklyuziv chiqish.'}
  ),
  scratch(4,
      {'ru': 'Скретч / Turntablist DJ', 'en': '
  const DjType(this.id, this.localizationTitle, this.localizationDesc);

  String get label => localizationTitle[LangController.current.id] ?? localizationTitle['en'] ?? id.toString();
  String get description => localizationDesc[LangC, 'uz': 'Minimal Techno'}),
  industrialTechno(15, 3, 3, {'ru': 'Industrial Techno', 'en': 'Industrial Techno', 'uz': 'Industrial Techno'}),
  acidTechno(16, 3, 3, {'ru': 'Acid Tech
      MusicGenre.values.cast<MusicGenre?>().firstWhere((e) => e?.id == id, orElse: () => null);

  List<MusicGenre> get subGenres =>
      MusicGenre.values.where((e) => вe.parentId == id).toList();

  bool get hasChildren => subGenres.isNotEmpty;
}