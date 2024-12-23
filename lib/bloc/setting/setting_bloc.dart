import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language/bloc/setting/setting_state.dart';

class SettingsBloc extends Cubit<SettingsState> {
  bool _isLanguageOptionExpanded = false;

  SettingsBloc() : super(SettingsInitial());

  void toggleLanguageOptionExpansion() {
    _isLanguageOptionExpanded = !_isLanguageOptionExpanded;
    emit(LanguageToggleState(_isLanguageOptionExpanded));
  }
}
