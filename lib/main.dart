import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokédex")),
      body: Center(child: Text("Lista de Pokémon vai aqui")),
    );
  }
}
