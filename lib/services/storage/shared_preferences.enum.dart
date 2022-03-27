enum SharedPreferenceKey {
  appLanguage,
  appIsThemeDark,
}

List<String> getAllSharedPreferenceKeys() {
  return SharedPreferenceKey.values.map((e) => e.name).toList();
}
