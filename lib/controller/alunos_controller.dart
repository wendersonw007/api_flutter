

import 'package:consumo_api/models/aluno.dart';
import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';
import 'package:consumo_api/models/telefone.dart';
import 'package:consumo_api/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  //busca todos da lista
  Future<void> findAll()  async {
    final alunos = await _alunosRepository.findAll();
    alunos.forEach(print);
  }

  //busca somente um id
  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
    print('aluno acima');
  }

  Future<void>update() async {
    final aluno = await _alunosRepository.findById('1');
    aluno.nomeCursos?.add('Imersao Joel Jota');
    await _alunosRepository.update(aluno);

    final alunoAlterado = await _alunosRepository.findById('1');
    print(alunoAlterado.nome);
    print('Tem os cursos');
    print(alunoAlterado.nomeCursos);
    print('nome alterado nome cursos');
  }

  Future<void>insert() async {
    final aluno = Aluno(
        id: '3',
        nome: 'Anthony Sobrinho',
          nomeCursos: ['Academia do flutter'],
        endereco: Endereco(
            rua: 'Sanfa fé do sul',
            numero: 3228,
            cep: '15043060',
            cidade: Cidade(id: 1,
              nome: 'São José do Rio Preto'
            ),
            telefone: Telefone(ddd: 17, telefone: '90909090'),
        ),
        cursos: [
          Curso(id: 1, nome: 'Academia do flutter', isAluno: true),
          Curso(id: 2, nome: 'Imersao getx', isAluno: false),
        ]
    );

    _alunosRepository.insert(aluno);



  }




}