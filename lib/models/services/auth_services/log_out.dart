import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

void sharedPreferencesLogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Clear all data in SharedPreferences
  await prefs.clear();

  // Or remove a specific key
  await prefs.remove('email');

  log("Shared Preferences cleared");
}
