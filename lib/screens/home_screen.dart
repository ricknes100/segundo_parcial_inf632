import 'package:flutter/material.dart';

import '../views/convert_currency_view.dart';
import '../views/convert_number_view.dart';
import '../views/prime_numbers_view.dart';
import '../views/theme_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentScreenIndex = 0;
  final screens = [
    const ConvertNumberView(),
    const ConvertCurrencyView(),
    const PrimeNumbersView(),
    const ThemeView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentScreenIndex]),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentScreenIndex = index;
          });
        },
        selectedIndex: currentScreenIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.compare_arrows),
            icon: Icon(Icons.compare_arrows),
            label: 'Convertir',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.currency_exchange),
            icon: Icon(Icons.currency_exchange_outlined),
            label: 'Moneda',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.numbers_outlined),
            icon: Icon(Icons.numbers_outlined),
            label: 'Primo',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.dark_mode),
            icon: Icon(Icons.dark_mode_outlined),
            label: 'Temas',
          )
        ],
      ),
    );
  }
}
