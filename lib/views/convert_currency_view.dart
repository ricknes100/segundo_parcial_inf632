import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:segundo_parcial_inf632/widgets/header.dart';

import '../providers/theme_notifier.dart';

class ConvertCurrencyView extends StatefulWidget {
  const ConvertCurrencyView({super.key});

  @override
  State<ConvertCurrencyView> createState() => _ConvertCurrencyViewState();
}

class _ConvertCurrencyViewState extends State<ConvertCurrencyView> {
  int inputValue = 0;
  double result = 0;
  String currency = 'bs';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void convertirDivisa() {
    if (currency == 'bs') {
      result = inputValue / 6.96;
    } else {
      result = inputValue * 6.96;
    }
  }

  @override
  Widget build(BuildContext context) {

    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Header(title: 'Conversor de moneda'),
          const SizedBox(height: 16.0),
          Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Importe',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => inputValue = int.parse(value),
              validator: (value) {
                if (value!.isEmpty) return 'Campo requerido';
                if (int.parse(value) <= 0) return 'Ingresa una cantidad válida';
                return null;
              },
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      (currency == 'bs') ? 'BOB' : 'USD',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: themeNotifier.themeMode == ThemeMode.dark ? Colors.white : const Color(0xFF313f5b),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text((currency == 'bs')
                        ? 'Bolivianos'
                        : 'Dólar estadounidense')
                  ],
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: IconButton(
                    color: Colors.deepPurple,
                    onPressed: () {
                      setState(() {
                        if (currency == 'bs') {
                          currency = 'usd';
                        } else {
                          currency = 'bs';
                        }
                        convertirDivisa();
                      });
                    },
                    icon: const Icon(Icons.compare_arrows),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      (currency == 'bs') ? 'USD' : 'BOB',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: themeNotifier.themeMode == ThemeMode.dark ? Colors.white : const Color(0xFF313f5b),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text((currency == 'bs')
                        ? 'Dólar estadounidense'
                        : 'Bolivianos')
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  convertirDivisa();
                });
              }
            },
            child: const Text('CONVERTIR'),
          ),
          const SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$inputValue ${(currency == 'bs') ? 'Bolivianos' : 'Dólares estadounidenses'} =",
                  style: TextStyle(fontSize: 16.0, color: themeNotifier.themeMode == ThemeMode.dark ? Colors.white : const Color(0xFF313f5b)),
                ),
                Text(
                  '${result.toStringAsFixed(2)} ${(currency != 'bs') ? 'Bolivianos' : 'Dólares estadounidenses'}',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: themeNotifier.themeMode == ThemeMode.dark ? Colors.white : const Color(0xFF313f5b),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*
class _CurrencyBox extends StatefulWidget {
  final String symbol;
  String currency;

  _CurrencyBox({super.key, required this.symbol, required this.currency});

  @override
  State<_CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<_CurrencyBox> {
  @override
  Widget build(BuildContext context) {
    return
  }
}
*/
