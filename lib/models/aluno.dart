import 'dart:convert';

import 'package:consumo_api/models/endereco.dart';
import 'package:consumo_api/models/telefone.dart';

import 'curso.dart';

class Aluno {
  String? id;
  String? nome;
  int? idade;
  List<String>? nomeCursos;
  late Endereco endereco;
  List<Curso>? cursos; // temos uma lista de um objeto, tem que converter

  Aluno({
    required this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.endereco,
    required this.cursos});


  //toMap() é o método que pega o objeto (telefone) e transforma em Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos, // ele não é um objeto é um array de String
      'endereco': endereco.toMap(), // é um objeto, preciso do toMap
      'cursos': cursos?.map((curso) => curso.toMap()).toList(),
    };
  }

  // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      idade: map['idade'],
      // nomeCursos: List<String>.from(map['nomeCursos']),
      endereco: Endereco.fromMap(map['endereco']),
      nomeCursos: map['nomeCursos'].cast<String>(),
      cursos: map['cursos'].map<Curso>((cursoMap) => Curso.fromMap(cursoMap)).toList(), // curso é uma lista

    );
  }

  // toJson() é um método que retorna uma String json do meu objeto Telefone
  String toJson() => jsonEncode(toMap());

  // fromJson() é um método que baseado em uma String json retorna um objeto telefone
  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Aluno{id: $id, nome: $nome, idade: $idade, nomeCursos: $nomeCursos, endereco: $endereco, cursos: $cursos}';
  }
}