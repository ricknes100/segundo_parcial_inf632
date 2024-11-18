import 'package:flutter/material.dart';
import 'package:segundo_parcial_inf632/widgets/header.dart';

class PrimeNumbersView extends StatefulWidget {
  const PrimeNumbersView({super.key});

  @override
  State<PrimeNumbersView> createState() => _PrimeNumbersViewState();
}

class _PrimeNumbersViewState extends State<PrimeNumbersView> {

  int inputValue = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _esPrimo(int n) {
    int divisores = 0;

    for (int i = 1; i <= n; i++) {
      if (n % i == 0) divisores++;
    }
    return divisores == 2;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Header(title: '¿Es primo?'),
          const SizedBox(height: 16.0),
          Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingresa un número',
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
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_esPrimo(inputValue) ? 'Es primo' : 'NO es primo'),
                    backgroundColor: Colors.blue[700],
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            child: const Text('VERIFICAR'),
          ),
        ],
      ),
    );
  }
}
