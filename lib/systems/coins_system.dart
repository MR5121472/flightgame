// lib/systems/coins_system.dart
import 'package:shared_preferences/shared_preferences.dart';

class CoinsSystem {
  int coins = 0;

  CoinsSystem() {
    loadCoins();
  }

  Future<void> loadCoins() async {
    final prefs = await SharedPreferences.getInstance();
    coins = prefs.getInt('coins') ?? 0;
  }

  Future<void> addCoins(int value) async {
    coins += value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('coins', coins);
  }
}