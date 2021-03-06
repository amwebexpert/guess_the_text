enum SharedPreferenceKey {
  appLanguage,
  appIsThemeDark,
  lastSelectedCategory,
}

List<String> getAllSharedPreferenceKeys() => SharedPreferenceKey.values.map((e) => e.name).toList();
