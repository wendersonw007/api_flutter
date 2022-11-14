import 'dart:convert';

class Curso {
 int? id;
 String? nome;
 bool? isAluno;


 //construtor
 Curso({
   required this.id,
   required this.nome,
   required this.isAluno
 });

//toMap() é o método que pega o objeto (telefone) e transforma em Map<String, dynamic>
 Map<String, dynamic> toMap() {
   return {
     'id': id,
     'nome': nome,
     'isAluno': isAluno,
   };
 }

  // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      isAluno: map['isAluno'] ?? '',
    );
  }

  // toJson() é um método que retorna uma String json do meu objeto Telefone
  String toJson() => jsonEncode(toMap());

  // fromJson() é um método que baseado em uma String json retorna um objeto telefone
  factory Curso.fromJson(String json) => Curso.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Curso{id: $id, nome: $nome, isAluno: $isAluno}';
  }
}