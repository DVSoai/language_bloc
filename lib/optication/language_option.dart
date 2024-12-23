import 'package:flutter/material.dart';

class LanguageOption {
  final Locale locale;
  final String displayName;
  final String flagIcon;

  LanguageOption({
    required this.locale,
    required this.displayName,
    required this.flagIcon,
  });
}
