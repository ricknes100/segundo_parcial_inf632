import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_notifier.dart';

class Header extends StatelessWidget {

  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color:  themeNotifier.themeMode == ThemeMode.dark ? Colors.grey[900] : Colors.deepPurple[50],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            color: themeNotifier.themeMode == ThemeMode.dark ? Colors.purple[50] : Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
