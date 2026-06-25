enum AppLanguage {
  ru('ru', 'Russian'),

  final String id;
  final String displayName;
  const AppLanguage(this.id(AppLanguage newLang) {
    current = newLang;
  }
}
{}