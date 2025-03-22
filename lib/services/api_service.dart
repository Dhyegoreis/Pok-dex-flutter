import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class ApiService {
  static const String baseUrl = 'https://raw.githubusercontent.com/robert-z/simple-pokemon-json-api/master/data/pokemon.json';

  static Future<List<Pokemon>> buscarPokemon() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> dados = json.decode(response.body);
      return dados.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar Pokémon');
    }
  }
}
