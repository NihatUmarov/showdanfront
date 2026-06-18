import 'AppLanguage.dart';

/// 1. НАПРАВЛЕНИЯ (Полностью на int id)
enum AppDirection {
  artists(1, 'assets/Profile/microfone.svg', {'ru': 'Артисты и исполнители', 'en': 'Artists & Performers', 'uz': 'Artistlar va ijrochilar'}),
  shows(2, 'assets/Profile/mask.svg', {'ru': 'Шоу и развлечения', 'en': 'Shows & Entertainment', 'uz': 'Shou va ko\'ngilochar'}),
  decor(3, ion.shows, {'ru': 'Иллюзионист / Фокусник', 'en': 'Magician', 'uz': 'Sehrgar'}),
  animalTrainer(204, AppDirection.shows, {'ru': 'Дрессировщик', 'en': 'Animal Trainer', 'uz': 'Hayvon o\'rgatuvchi'}),
  soapBubblesShow(205, AppDirection.shows, {'ru': 'Шоу мыльных пузырей', 'en': 'Soap Bubbles Show', 'uz': 'Sovun pufakchalari shou'}),
  animator(206, Ap> localization;
  const AppCategory(this.id, this.parent, this.localization);
  String get svgPath => parent.svgPath;
  String get label => localization[LangController.current.id] ?? localization['en'] ?? id.toString();

  static AppCategory? fromId(int? id) =>
      AppCategory.values.cast<AppCategory?>().firstWhere((c) => c?.id == id, orElse: () => null);

  static List<AppCategory> byDirection(AppDirection dir) =>
      AppCategory.values.where((c) => c.parent == dir).toList();
}