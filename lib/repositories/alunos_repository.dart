import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/aluno.dart';

class AlunosRepository {

  // url para buscar o caminho de geral
  Future<List<Aluno>> findAll() async {
    // final alunosResponse = await http.get(Uri.parse('http://localhost:8081/contrato/waychef/item-configuracao/buscar-todos'));
    final alunosResponse = await http.get(Uri.parse('http://localhost:3031/alunos'));
    print(alunosResponse.body);
    print('alunosResponse.body acima');

    final alunosList = jsonDecode(alunosResponse.body);
    print(alunosList);
    print('alunosResponse.list acima, aqui vira um mapa um objeto de verdade');

    //um objeto para o dart vira um map,
    return alunosList.map<Aluno>((alunoMap){
      return Aluno.fromMap(alunoMap);
    }).toList();

  }

  // url para buscar o caminho somente de 1 id
  Future<Aluno> findById(String id) async {
    final alunoResponse = await http.get(Uri.parse('http://localhost:3031/alunos/$id'));
    // final alunoMap = jsonDecode(alunoResponse.body);
    // return Aluno.fromMap(alunoMap);
    // ou posso substituir pelo debaixo
    return Aluno.fromJson(alunoResponse.body);

  }

  //caminho para realizar o update, insere um novo curso
  Future<void> update(Aluno aluno) async {
    http.put
    (Uri.parse('http://localhost:3031/alunos/${aluno.id}'),
    body:aluno.toJson(),
    headers: {
      'content-type': 'application/json',
    });
  }

  //caminho para realizar o insert
  Future<void> insert(Aluno aluno) async {
    http.post
      (Uri.parse('http://localhost:3031/alunos/'),
        body:aluno.toJson(),
        headers: {
          'content-type': 'application/json',
        });
  }




}