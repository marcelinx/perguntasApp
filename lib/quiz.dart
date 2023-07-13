import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List <Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  Quiz({
   required this.perguntas,
   required this.perguntaSelecionada,
   required this.quantoResponder,
  });

    bool get selectedAnswer {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
     List<Map<String, Object>> respostas = selectedAnswer 
    ? perguntas[perguntaSelecionada].cast()['respostas']
      : [];

    return  Column(
      children: <Widget>[
        Question(perguntas[perguntaSelecionada]['texto'].toString()),
          ...respostas
          .map((resp) {
           return Answer(
            resp['texto'].toString(),
            () => quantoResponder(int.parse(resp['pontuacao'].toString())),
          );
          }).toList(),
      ],
    );
  }
}