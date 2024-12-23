abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class LanguageToggleState extends SettingsState {
  final bool isExpanded;

  LanguageToggleState(this.isExpanded);
}
