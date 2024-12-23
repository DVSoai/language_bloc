import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language/bloc/language/language_bloc.dart';
import 'package:language/bloc/setting/setting_bloc.dart';
import 'package:language/pages/home_page.dart';
import 'package:language/routes/app_route.dart';
import 'package:language/storage/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final localStorage = LocalStorageImpl();
  await localStorage.init();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      startLocale: const Locale('vi'),
      fallbackLocale: const Locale('vi'),
      child: MyApp(localStorage: localStorage)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.localStorage});
  final LocalStorage localStorage;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageBloc(localStorage)),
        BlocProvider(create: (_) => SettingsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
