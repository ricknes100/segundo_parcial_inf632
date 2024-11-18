import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_notifier.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {

  bool active = false;

  @override
  Widget build(BuildContext context) {

    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Column(
      children: [
        ListTile(
          title: const Text('Modo oscuro'),
          trailing: Switch(
            value: themeNotifier.themeMode == ThemeMode.dark ? true : false,
            activeColor: Colors.deepPurple,
            onChanged: (bool value) {
              setState(() { active = value; });
              if (themeNotifier.themeMode == ThemeMode.light) {
                themeNotifier.setTheme(ThemeMode.dark);
              } else {
                themeNotifier.setTheme(ThemeMode.light);
              }
            },
          ),
        ),
      ],
    );
  }
}
