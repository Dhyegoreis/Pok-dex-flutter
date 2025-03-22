import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class ComparacaoPage extends StatefulWidget {
  final List<Pokemon> pokemons;

  const ComparacaoPage({super.key, required this.pokemons});

  @override
  _ComparacaoPageState createState() => _ComparacaoPageState();
}

class _ComparacaoPageState extends State<ComparacaoPage> {
  Pokemon? pokemon1;
  Pokemon? pokemon2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparação de Pokémon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<Pokemon>(
              hint: const Text("Escolha o primeiro Pokémon"),
              value: pokemon1,
              items: widget.pokemons.map((poke) {
                return DropdownMenuItem<Pokemon>(
                  value: poke,
                  child: Text(poke.nome),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  pokemon1 = value;
                });
              },
            ),
            DropdownButton<Pokemon>(
              hint: const Text("Escolha o segundo Pokémon"),
              value: pokemon2,
              items: widget.pokemons.map((poke) {
                return DropdownMenuItem<Pokemon>(
                  value: poke,
                  child: Text(poke.nome),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  pokemon2 = value;
                });
              },
            ),
            const SizedBox(height: 20),
            pokemon1 != null && pokemon2 != null
                ? Column(
                    children: [
                      _exibirComparacao(pokemon1!, pokemon2!),
                    ],
                  )
                : const Text("Selecione dois Pokémon para comparar"),
          ],
        ),
      ),
    );
  }

  Widget _exibirComparacao(Pokemon p1, Pokemon p2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _exibirPokemon(p1),
            const Text("VS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _exibirPokemon(p2),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "Peso: ${p1.peso} kg vs ${p2.peso} kg",
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          "Tipos: ${p1.tipos.join(", ")} vs ${p2.tipos.join(", ")}",
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _exibirPokemon(Pokemon pokemon) {
    return Column(
      children: [
        Image.network(pokemon.imagem, height: 100),
        Text(pokemon.nome, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
