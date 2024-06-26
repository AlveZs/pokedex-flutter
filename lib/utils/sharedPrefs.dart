import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  List<String> get favorites => _sharedPrefs.getStringList(keyFavorites) ?? [];

  set favorites(List<String> value) {
    _sharedPrefs.setStringList(keyFavorites, value);
  }
}

const String keyFavorites = "favorites";

final sharedPrefs = SharedPrefs();