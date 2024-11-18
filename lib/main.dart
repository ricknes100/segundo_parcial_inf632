import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_notifier.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child:  const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (BuildContext context, themeNotifier, Widget? child) {
        return MaterialApp(
          title: 'Segundo Parcial',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(
            useMaterial3: true
          ),
          darkTheme: ThemeData.dark(),
          themeMode: themeNotifier.themeMode,
          home: const HomeScreen(),
        );
      }
    );
  }
}
