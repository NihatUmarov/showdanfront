import 'AppLanguage.dart';

class S {
  static String _v(Map<String, String> translation, [String fallback = '']) {
    return translation[LangController.current.id] ?? translation['en'] ?? fallback;
  }
tersApply => _v({'ru': 'Применить', 'en': 'Apply', 'uz': 'Применить'});
  static String get filtersPricePerHour => _v({'ru': 'Цена за час', 'en': 'Price per hour', 'uz': 'Soatbay narx'});
  static String get genderMale => _v({'ru': 'Мужской', 'en': 'Male', 'uz': 'Erkak'});
  static String get genderFemale => _v({'ru': 'Женский', 'en': 'Female', 'uz': 'Ayol'});
ection => _v({'t => _v({'ru': 'Выйти', 'en': 'Log out', 'uz': 'Chiqish'});

  static String profileBalance(Object balance, Object currency) {return _v({'ru': 'Баланс: $balance $currency', 'en': 'Balance: $balance $currency', 'uz': 'Balans: $balance $currency',});}
  static String currerte) => _v({'ru': 'Статус на $date:', 'en': 'Status on $date:', 'uz': '$date dagi holat:'});
  static String get artistFullyFree => _v({'ru': 'Артист полностью свободен в этот день', 'en': 'The performer is completely free on this day', 'uz': 'Ijrochi ushbu kunda mutlaqo boʻsh'});

  stazbekistan => _v({'ru': 'Узбекистана', 'en': 'Uzbekistan Showbiz', 'uz': 'Oʻzbekiston shou-biznesi'});
  static String get newsFeedTabShowDan => _v({'ru': 'Новости ShowDan', 'en': 'ShowDan News', 'uz': 'ShowDan yangiliklari'});

}