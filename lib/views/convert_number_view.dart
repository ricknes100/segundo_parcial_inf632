import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:segundo_parcial_inf632/widgets/header.dart';

import '../providers/theme_notifier.dart';

const List<String> list = <String>[
  'Decimal',
  'Binario',
  'Octal',
  'Hexadecimal'
];

class ConvertNumberView extends StatefulWidget {
  const ConvertNumberView({super.key});

  @override
  State<ConvertNumberView> createState() => _ConvertNumberViewState();
}

class _ConvertNumberViewState extends State<ConvertNumberView> {

  int inputValue = 0;
  String result = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = list.first;

  String convertirNumero(int num) {
    String result = '';

    switch (dropdownValue) {
      case 'Decimal':
        result = num.toString().split('').reversed.join();
        break;
      case 'Binario':
        while (num > 0){
          result += "${num%2}";
          num = num ~/ 2;
        }
        break;
      case 'Octal':
        while (num > 0){
          result += "${num%8}";
          num = num ~/ 8;
        }
        break;
      case 'Hexadecimal':
        int aux = 0;
        while (num > 0){
          aux = num%16;
          if(aux > 9){
            String letra = '';
            switch(aux){
              case 10: letra = 'A'; break;
              case 11: letra = 'B'; break;
              case 12: letra = 'C'; break;
              case 13: letra = 'D'; break;
              case 14: letra = 'E'; break;
              case 15: letra = 'F'; break;
            }
            result += letra;
          } else {
            result += "${num%16}";
          }
          num = num ~/ 16;
        }
        break;
    }

    return result.split('').reversed.join();
  }

  @override
  Widget build(BuildContext context) {

    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Header(title: 'Convertir un número'),
          const SizedBox(height: 16.0),
          Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => inputValue = int.parse(value),
              validator: (value) {
                if (value!.isEmpty) return 'Campo requerido';
                if (int.parse(value) <= 0) return 'Valor debe ser mayor a 0';
                return null;
              },
            ),
          ),
          const SizedBox(height: 16.0),
          DropdownMenu<String>(
            initialSelection: list.first,
            width: double.infinity,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries:
                list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  result = convertirNumero(inputValue);
                });
              }
            },
            child: const Text('CONVERTIR'),
          ),
          const SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(result, style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: themeNotifier.themeMode == ThemeMode.dark ? Colors.white : const Color(0xFF313f5b)
            )),
          )
        ],
      ),
    );
  }
}
