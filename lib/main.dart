import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Settings/LocaleProvider.dart';
import 'Settings/ThemeProvider.dart';
import 'bottom_navigation_screen.dart';
import 'cubit/categories_cubit/cubit.dart';
import 'cubit/fhashcard_cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final locale = prefs.getString('locale') ?? 'en';

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        BlocProvider(create: (context) => CategoriesCubit()..createDatabase()),
        BlocProvider(create: (context) => FlashCardsCubit()..createDatabase()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
      builder: (context, themeProvider, localeProvider, child) {
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          locale: localeProvider.locale,
          supportedLocales: [
            Locale('en', ''),
            Locale('ar',''),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const BottomNavigationScreen(),
        );
      },
    );
  }
}
