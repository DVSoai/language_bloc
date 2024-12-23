import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language/bloc/language/language_bloc.dart';
import 'package:language/bloc/setting/setting_bloc.dart';
import 'package:language/core/l10n/locale_keys.g.dart';
import 'package:language/pages/language_page.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final languageCubit = context.read<LanguageCubit>();
    final languageBloc = context.read<LanguageBloc>();
    final settingsBloc = context.read<SettingsBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text(LocaleKeys.home).tr()),
      body: Center(
        child: LanguageSettingWidget(
          languageBloc: languageBloc,
          settingsBloc: settingsBloc,
        ),
      ),
    );
  }
}
