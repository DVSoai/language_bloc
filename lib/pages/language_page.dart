import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language/bloc/language/language_bloc.dart';
import 'package:language/bloc/language/language_state.dart';
import 'package:language/bloc/setting/setting_bloc.dart';
import 'package:language/bloc/setting/setting_state.dart';
import 'package:language/core/l10n/locale_keys.g.dart';

class LanguageSettingWidget extends StatelessWidget {
  // final LanguageCubit languageCubit;
  final LanguageBloc languageBloc;
  final SettingsBloc settingsBloc;

  LanguageSettingWidget({
    super.key,
    required this.languageBloc,
    required this.settingsBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: settingsBloc,
      builder: (context, state) {
        bool isExpanded = false;
        if (state is LanguageToggleState) {
          isExpanded = state.isExpanded;
        }

        return ExpansionTile(
          onExpansionChanged: (value) {
            settingsBloc.toggleLanguageOptionExpansion();
          },
          trailing: AnimatedRotation(
            turns: isExpanded ? 0.25 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(
              Icons.chevron_right,
              size: 30,
              color: Colors.grey,
            ),
          ),
          leading: Icon(
            Icons.language,
            size: 24,
            color: Colors.blue,
          ),
          title: Text(
            LocaleKeys.language.tr(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: languageBloc.getLanguageOptions().map((option) {
            // final selectedLanguage = (languageCubit.state is LanguageChanged)
            //     ? (languageCubit.state as LanguageChanged).locale
            //     : (languageCubit.state as LanguageInitial).locale;
            final selectedLanguage = (state is LanguageChanged)
                ? (state as LanguageChanged).locale
                : (state is LanguageInitial)
                    ? (state as LanguageInitial).locale
                    : languageBloc.getSelectedLanguage();

            return ListTile(
              leading: selectedLanguage == option.locale
                  ? const Icon(
                      Icons.check,
                      color: Colors.blue,
                    )
                  : const SizedBox(),
              title: Text(
                "${option.displayName} ${option.flagIcon}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                languageBloc.changeLanguage(context, option.locale);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
