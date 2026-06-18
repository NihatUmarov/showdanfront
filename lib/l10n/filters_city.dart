
import 'AppLanguage.dart';

enum AppCountry {
  uzbekistan(1);
  final int id;
  const AppCountry(this.id);
}

enum AppRegion {
  tashkentCit
  final Map<String, String> localization;
  const AppRegion(this.id, this.localization);

  String get label => localization[LangController.current.id] ?? localization['en'] ?? id;
}
enum AppCity {6414, 72.2389, {'ru': 'Асака', 'en': 'Asaka', 'uz': 'Asaka'}),
  khanabad(19, AppRegion.andijan, 40.8094, 72.9106, {'ru': 'Ханабад', 'en': 'Khanabad', 'uz': 'Xonobod'}),
  shakhrihan(20, AppRegion.andijan, 40.7136, 72.0519, {'ru': 'Шахрихан', 'en': 'Shakhrihan', 'uz': 'Shahrixon'}),
  karasu(21, AppRegion.andijan, 40.7417, 72.8689, {'ru': 'Карасу', 'en': 'Karasu', 'uz': 'Qorasuv'}),
  kurgantepa(22, AppRegion.andijan, 40.8419, 72.7606, {'ru': 'Кургантепа', 'en': 'Kurgantepa', 'uz': 'Qorg‘ontepa'}),
  marhamat(23, AppRegion.andijan, 40.4939, 72.3325, {'ru': 'Мархамат', 'en': 'Marhamat', 'uz': 'Marhamat'}),
  pahtaabad(24, AppRegion.andijan, 40.9278, 72.4833, {'ru': 'Пахтаабад', 'en': 'Pahtaabad', 'uz': 'Paxtaobod'}),
  dustlik(25, AppRegion.andijan, 40.8875, 72.2311, {'ru': 'Дустлик', 'en': 'Dustlik', 'uz': 'Do‘stlik'}),
  khodjaobod(26, AppRegion.andijan, 40.6697, 72.5647, {'ru': 'Ходжаабад', 'en': 'Khodjaobod', 'uz': 'Xo‘jaobod'}),
  chinabod(27, AppRegion.andijan, 40.9161, 72.1158, {'ru': 'Чинабад', 'en': 'Chinabod', 'uz': 'Chnobod'}),

  // === Buxoro viloyati ===
  bukhara(28, AppRegi.3139, 67.9583, {'ru': 'Пахтакор', 'en': 'Pakhtakor', 'uz': 'Paxtakor'}),
  marjanbulak(45, AppRegion.jizzakh, 39.9819, 67.4081, {'ru': 'Маржанбулак', 'en': 'Marjanbulak', 'uz': 'Marjonbuloq'}),

  // === Qashqadaryo viloyati ===
  karshi(46, AppRegion.kashkadarya, 38.8614, 65.7953, {'ru': 'Карши', 'en': 'Karshi', 'uz': 'Qarshi'}),
  shakhrisabz(47, AppRegion.kashkadarya, 39.0544, 66.8294, {'ru': 'Шахрисабз', 'en': 'Shakhrisabz', 'uz': 'Shahrisabz'}),
  kitab(48, AppRegion.kashkadarya, 39.1236, 66.8833, {'ru': 'Китаб', 'en': 'Kitab', 'uz': 'Kitob'}),
  koson(49, AppRegion.kashkadarya, 39.0372, 65.5847, {'ru': 'Касан', 'en': 'Koson', 'uz': 'Koson'}),
  mubarek(50, AppRegion.kashkadarya, 39.2556, 65.1528, {'ru': 'Мубарек', 'en': 'Mubarek', 'uz': 'Muborak'}),
  kamashi(51, AppRegion.ka
  // === Namangan viloyati ===
  namangan(64, AppRegion.namangan, 40.9983, 71.6725, {'ru': 'Наманган', 'en': 'Namangan', 'uz': 'Namangan'}),
  chust(65, AppRegion.namangan, 41.0094, 71.2269, {'ru': 'Чуст', 'en': 'Chust', 'uz': 'Chust'}),
  chartak(66, A71.7878, {'ru': 'Фергана', 'en': 'Fergana', 'uz': 'Farg‘ona'}),
  kostan, 43.7844, 59.0314, {'ru': 'Муйнак', 'en': 'Muynak', 'uz': 'Mo‘ynoq'}),
  bustan(122, AppRegion.karakalpakstan, 41.8483, 60.7114, {'ru': 'Бустан', 'en': 'Bustan', 'uz': 'Bo‘ston'}),
  shmanay(123, AppRegion.karakalpakstan, 42.9914, 59.1031, {'ru': 'Шуманай', 'en': 'Shmanay', 'uz': 'Shumanay'}),
  mangit(124, AppRegion.karakalpakstan, 42.1158, 60.0597, {'ru': 'Мангит', 'en': 'Mangit', 'uz': 'Manqit'});

  final int id;
  final AppRegion region;
  final double latitude;
  final double longitude;
  final Map<String, String> localization;

  const AppCity(this.id, this.region, this.latitude, this.longitude, this.localization);
  AppCountry get country => AppCountry.uzbekistan;
  String get label => localization[LangController.current.id] ?? localization['en'] ?? name;

  static AppCity? fromId(int? cityId) {
    if (cityId == null) return null;
    for (final city in AppCity.values) {
      if (city.id == cityId) return city;
    }
    return null;
  }
}