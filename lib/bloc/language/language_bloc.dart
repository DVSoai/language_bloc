import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language/bloc/language/language_event.dart';
import 'package:language/bloc/language/language_state.dart';
import 'package:language/main.dart';
import 'package:language/optication/language_option.dart';
import 'package:language/storage/local_storage.dart';

class LanguageBloc extends Cubit<LanguageState> {
  final LocalStorage _localStorage;

  LanguageBloc(this._localStorage)
      : super(LanguageInitial(_localStorage.locale));

  List<LanguageOption> getLanguageOptions() {
    return [
      LanguageOption(
        locale: const Locale('en'),
        displayName: 'English',
        flagIcon: '🇺🇸',
      ),
      LanguageOption(
        locale: const Locale('vi'),
        displayName: 'Tiếng Việt',
        flagIcon: '🇻🇳',
      ),
    ];
  }

  void changeLanguage(BuildContext context, Locale locale) {
    _localStorage.locale = locale;
    // EasyLocalization.of(context)!.setLocale(locale);
    context.setLocale(locale);
    emit(LanguageChanged(locale));
  }

  Locale getSelectedLanguage() {
    return _localStorage.locale;
  }
}

// class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
//   final LocalStorage _localStorage;

//   LanguageBloc(this._localStorage)
//       : super(LanguageInitial(_localStorage.locale)) {
//     on<ChangeLanguageEvent>(_onChangeLanguage);
//   }

//   void _onChangeLanguage(
//       ChangeLanguageEvent event, Emitter<LanguageState> emit) {
//     _localStorage.locale = event.locale;
//     event.context.setLocale(event.locale);
//     emit(LanguageChanged(event.locale));
//   }

//   List<LanguageOption> getLanguageOptions() {
//     return [
//       LanguageOption(
//         locale: const Locale('en'),
//         displayName: 'English',
//         flagIcon: '🇺🇸',
//       ),
//       LanguageOption(
//         locale: const Locale('vi'),
//         displayName: 'Tiếng Việt',
//         flagIcon: '🇻🇳',
//       ),
//     ];
//   }

//   Locale getSelectedLanguage() {
//     return _localStorage.locale;
//   }
// }
