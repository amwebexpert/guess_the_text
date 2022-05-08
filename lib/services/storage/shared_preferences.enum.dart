enum SharedPreferenceKey {
  appLanguage,
  appIsThemeDark,
}

List<String> getAllSharedPreferenceKeys() => SharedPreferenceKey.values.map((e) => e.name).toList();
