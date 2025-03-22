class Pokemon {
  final int id;
  final String nome;
  final String imagem;
  final double peso;
  final List<String> tipos;

  Pokemon({
    required this.id,
    required this.nome,
    required this.imagem,
    required this.peso,
    required this.tipos,
  });

  // Converte JSON para um objeto Pokemon
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      nome: json['name'],
      imagem: json['sprites']['animated'],
      peso: (json['weight'] as num).toDouble(),
      tipos: List<String>.from(json['types']),
    );
  }
}

