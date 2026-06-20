import '../AppLanguage.dart';

/// 1. ГРУППЫ МЕРОПРИЯТИЙ (Новый enum — отсчет ID с 1)
enum EventGroup 
  const EventGroup(this.id, this.localization);
  String get label => localization[LangController.current.id] ?? localization['en'] ?? name;

  static EventGroup? fromId(int? id) =>
      EventGroup.values.cast<EventGroup?>().firstWhere((e) => e?.id == id, orElse: () => null);
}
в