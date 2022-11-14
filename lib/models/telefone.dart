import 'dart:convert';

class Telefone {

  int? ddd;
  String? telefone;

//construtor
  Telefone({required this.ddd, required this.telefone});


  //toMap() é o método que pega o objeto (telefone) e transforma em Map<String, dynamic>
  Map<String, dynamic> toMap(){
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }
  // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  // toJson() é um método que retorna uma String json do meu objeto Telefone
  String toJson() => jsonEncode(toMap());


  // fromJson() é um método que baseado em uma String json retorna um objeto telefone
  // factory Telefone.fromJson(String json) {
  //   Map<String, dynamic> jsonMap = jsonDecode(json);
  //   final telefone = Telefone.fromMap(jsonMap);
  //   return telefone;
  // }
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Telefone{ddd: $ddd, telefone: $telefone}';
  }
}