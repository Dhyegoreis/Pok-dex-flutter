import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class DetalhesPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetalhesPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(pokemon.imagem, height: 200),
            const SizedBox(height: 20),
            Text(
              pokemon.nome,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Peso: ${pokemon.peso} kg',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Tipos: ${pokemon.tipos.join(", ")}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
