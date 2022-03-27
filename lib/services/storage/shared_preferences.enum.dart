enum SharedPreferenceKey {
  appLanguage,
  appThemeBrightness,
}

List<String> getAllSharedPreferenceKeys() {
  return SharedPreferenceKey.values.map((e) => e.name).toList();
}
