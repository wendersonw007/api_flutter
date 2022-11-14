import 'dart:convert';

import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/telefone.dart';

class Endereco {
  String? rua;
  int? numero;
  String? cep;
  late Cidade cidade;
  late Telefone telefone;


  //construtor
  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });

  //toMap() é o método que pega o objeto (telefone) e transforma em Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'CEP': cep,
      'cidade': cidade.toMap(),
      'telefone': telefone.toMap(),

    };
  }
  // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? '',
      cep: map['CEP'] ?? '',
      cidade: Cidade.fromMap(map['cidade']),
      telefone: Telefone.fromMap(map['telefone']),


    );
  }

  // toJson() é um método que retorna uma String json do meu objeto Telefone
  String toJson() => jsonEncode(toMap());

  // fromJson() é um método que baseado em uma String json retorna um objeto telefone
  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Endereco{rua: $rua, numero: $numero, cep: $cep, cidade: $cidade, telefone: $telefone}';
  }
}