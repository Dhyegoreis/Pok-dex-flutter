import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/home_page.dart'; // Ajuste o caminho se necessário
import 'package:pokedex/pages/detalhes_page.dart'; // Ajuste o caminho se necessário

void main() {
  testWidgets('Testa se a lista de Pokémon carrega e navega para a página de detalhes', (WidgetTester tester) async {
    // Criação de um Pokémon fictício para o teste
    final pokemon = Pokemon(
      nome: 'Pikachu',
      imagem: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
      peso: 6.0,
      tipos: ['Elétrico'],
    );

    // Mock de chamada da API para retornar o Pokémon fictício
    // Aqui, em vez de fazer uma requisição real, você pode usar pacotes como 'mockito' ou 'mocktail' para mockar as respostas
    // Mas no caso, vou fazer um exemplo simples assumindo que a função 'ApiService.buscarPokemon()' já retorna o Pokémon criado acima.

    // Build do widget
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Aguarda até que os dados sejam carregados
    await tester.pumpAndSettle();

    // Verifica se o Pokémon está sendo exibido na lista
    expect(find.text('Pikachu'), findsOneWidget);
    expect(find.text('Peso: 6.0 kg'), findsOneWidget);

    // Tenta tocar no item da lista para navegar para a página de detalhes
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle(); // Espera a navegação

    // Verifica se a página de detalhes foi carregada
    expect(find.text('Pikachu'), findsOneWidget);
    expect(find.text('Peso: 6.0 kg'), findsOneWidget);
  });

  testWidgets('Testa se o botão de comparação funciona', (WidgetTester tester) async {
    // Build do widget
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Aguarda até que os dados sejam carregados
    await tester.pumpAndSettle();

    // Verifica se o botão de comparação está visível
    expect(find.byIcon(Icons.compare), findsOneWidget);

    // Toca no botão de comparação
    await tester.tap(find.byIcon(Icons.compare));
    await tester.pumpAndSettle(); // Espera a navegação

    // Verifica se a página de comparação foi carregada
    expect(find.text('Comparação de Pokémon'), findsOneWidget);
  });
}
