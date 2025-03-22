import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/pokemon.dart';
import 'detalhes_page.dart';
import 'comparacao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Pokemon>> _pokemons;

  @override
  void initState() {
    super.initState();
    _pokemons = ApiService.buscarPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar Pokémon'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum Pokémon encontrado.'));
          }

          List<Pokemon> pokemons = snapshot.data!;

          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              Pokemon pokemon = pokemons[index];

              return ListTile(
                leading: Image.network(pokemon.imagem),
                title: Text(pokemon.nome),
                subtitle: Text('Peso: ${pokemon.peso} kg'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalhesPage(pokemon: pokemon),
                    ),
                  );  
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FutureBuilder<List<Pokemon>>(
        future: _pokemons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(); // Não exibe o botão durante o carregamento
          } else if (snapshot.hasError) {
            return const SizedBox(); // Não exibe o botão se houver erro
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const SizedBox(); // Não exibe o botão se não houver pokémons
          }

          return FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ComparacaoPage(pokemons: snapshot.data!),
                ),
              );
            },
            child: const Icon(Icons.compare),
          );
        },
      ),
    );
  }
}
