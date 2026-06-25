import '../AppLanguage.dart';
 'en': 'Alternative / Absurd', 'uz': 'Absurd komediyasi'},
      {'ru': 'Сюрреалистичный юмор, разрыв шаблонов и необычная подача.', 'en': 'Surreal humor, breaking patterns, and unusual delivery.', 'uz': 'Sюрреал yumor, qoliplarni sindirish va g‘ayrioddiy taqdimot.'}
  );

  final int id;
  final Map<String, String> localizationTitle;
  final Map<String, String> localizationDesc;

  const StandupStyle(this.id, this.localizationTitle, this.localizationDesc);

  String get label => localizationTitle[LangController.current.id] ?? localizationTitle['en'] ?? id.toString();
  String get description => localizationDesc[LangController.current.id] ?? localizationDesc['en'] ?? '';

{}
 {'ru': 'Сольны
  final Map<String, String> localization;
  const StandupFormat(this.id, this.localization);

  String get label => localization[anвdupFormat?>().firstWhere((e) => e?.id == id, orElse: () => null);
}
в
/// 3. ВОЗРАСТНОЙ ЦЕНЗ / ОГРАНИЧЕНИЕ КОНТЕНТА
enum StandupCensorship {
en': '18+ Uncensored / Explicit', 'uz': '18+ (Cheklovlarsiz / Soʻkinish)'});

  final int id;
  final Map<String, String> localization;
  const StandupCensorship(this.id, this.localization);

  String get label => localization[LangController.current.id] ?? localization['en'] ?? name;

  static StandupCensorship fromId(int? id) =>
      StandupCensorship.values.firstWhere((e) => e.id == id, orElse: () => StandupCensorship.casual16);
}