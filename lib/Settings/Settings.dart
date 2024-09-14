import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LocaleProvider.dart';
import 'ThemeProvider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Dark/Light Mode
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme Mode'),
            trailing: Switch(
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
          const Divider(),

          // Switch Language
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: DropdownButton<Locale>(
              value: localeProvider.locale,
              onChanged: (locale) {
                if (locale != null) {
                  localeProvider.setLocale(locale);
                }
              },
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('ar'), child: Text('Arabic')), // Add more languages as needed
              ],
            ),
          ),
          const Divider(),

          // About App
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About App'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Flashcard Quiz App',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.info),
                children: const [
                  Text('This app helps you study with flashcards.'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
