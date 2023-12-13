import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController distanciaController = TextEditingController();
  TextEditingController consumoController = TextEditingController();
  TextEditingController valorLitroController = TextEditingController();

  double litrosNecessarios = 0.0;
  double custoTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Auto Tracker - Calculadora de Consumo'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: distanciaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Distância a percorrer (km)'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: consumoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Consumo do veículo (km/l)'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: valorLitroController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Valor do litro da gasolina (R\$)'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    calcularCustoTotal();
                  },
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 20),
                Text(
                    'Litros necessários: ${litrosNecessarios.toStringAsFixed(2)} litros'),
                const SizedBox(height: 10),
                Text('Custo total: R\$ ${custoTotal.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calcularCustoTotal() {
    double distancia = double.tryParse(distanciaController.text) ?? 0.0;
    double consumoVeiculo = double.tryParse(consumoController.text) ?? 0.0;
    double valorLitro = double.tryParse(valorLitroController.text) ?? 0.0;

    if (distancia > 0 && consumoVeiculo > 0 && valorLitro > 0) {
      setState(() {
        litrosNecessarios = distancia / consumoVeiculo;
        custoTotal = litrosNecessarios * valorLitro;
      });
    } else {
      // Trate casos de entrada inválida aqui, se necessário
    }
  }
}
