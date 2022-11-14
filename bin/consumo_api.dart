import 'dart:convert';

import 'package:consumo_api/consumo_api.dart' as consumo_api;
import 'package:consumo_api/controller/alunos_controller.dart';
import 'package:consumo_api/models/telefone.dart';


void main(List<String> arguments) {

  //busca todos os dados
  // AlunosController().findAll();

  //busca somente um id especifico
  // AlunosController().findById('1');

  //faz uma atualização, inclui o nome de novo curso
  // AlunosController().update();


  // Realizando o insert, um de cada vez, abaixo
  // AlunosController().insert();
  AlunosController().findById('fe90d480-6427-11ed-bd27-ed955b254a89');



}







void main2(List<String> arguments) {
  final cidadeJson = ''' 
    [
      {
        "id": 1,
        "nome": "São José do Rio Preto",
        "regiao": {
                    "nome": "Zona Norte"
                    }
      },
      {
        "id": 2,
        "nome": "Nhandeara",
         "regiao": 
              {
                "nome": "Zona Norte"
         }
      }
    ]   

  ''' ;
  //   {
  //    "id": 1,
  //    "nome": "São José do Rio Preto"
  //   }

  // [] => retorna um List
  // {} => retorna um Map<String, dynamic>

  final cidadeMap = json.decode(cidadeJson);

  print(cidadeMap.runtimeType);
  print(cidadeMap);

  print(cidadeMap[0].runtimeType);
  // print(cidadeMap[1].runtimeType);


   if(cidadeMap is List){
     print('Esse objeto é uma lista');
     // print(cidadeMap['nome']);
   } else if (cidadeMap is Map) {
     print('Esse objeto é um Map');
   }

   cidadeMap.forEach((nada) => print(nada['nome']));
   cidadeMap.forEach((nada) => print(nada['regiao']['nome']));


  /*
  *****************************************
  *****************************************
  *********EXEMPLO DE DECODE ***********
  ******************************************
  ******************************************
   */

  final cidadeMapJson = ''' 
      {
        "id": 1,
        "nome": "São José do Rio Preto",
        "regiao": {
                    "nome": "Zona Norte"
                    }
      },
      {
        "id": 2,
        "nome": "Nhandeara",
         "regiao": 
              {
                "nome": "Zona Norte"
         }
      }
  ''' ;
  print('Encode');
  print(json.encode([cidadeMapJson]));

  final telefoneJson = '''
  {
      "ddd": 11,
      "telefone": "98986535"
  }
  
  ''';
  final telefone = Telefone.fromJson(telefoneJson);
  print(telefone.ddd);
  print(telefone.telefone);
  print(telefone.toJson()); // transformando em json, quando tem as aspas
  print(telefone.toMap()); // transformando em map, quando não tem aspas é mapa

}
