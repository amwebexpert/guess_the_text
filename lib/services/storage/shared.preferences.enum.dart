enum SharedPreferenceKey {
  appLanguage,
  appIsThemeDark,
  lastSelectedCategory,
  lastSelectedCategoriesListType,
}

List<String> getAllSharedPreferenceKeys() => SharedPreferenceKey.values.map((e) => e.name).toList();
