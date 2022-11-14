import 'dart:convert';

class Cidade {
  int? id;
  String? nome;

  //construtor
  Cidade({required this.id, required this.nome});

  //toMap() é o método que pega o objeto (telefone) e transforma em Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }
  // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
    );
  }

  // toJson() é um método que retorna uma String json do meu objeto Telefone
  String toJson() => jsonEncode(toMap());

  // fromJson() é um método que baseado em uma String json retorna um objeto telefone
  factory Cidade.fromJson(String json) => Cidade.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Cidade{id: $id, nome: $nome}';
  }
}