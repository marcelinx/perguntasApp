import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import 'results.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
      {
        'texto': 'quer namorar comigo?',
        'respostas': ['sim', 'com certeza', 'claro', 'nao']
      }, 
      {
        'texto': 'quer casar comigo?',
        'respostas': ['sim', 'com certeza', 'claro', 'nao'],
      }, 
      {
        'texto': 'como voce deve chamar seu namorado?',
        'respostas': ['amor', 'vida', 'meu tudo', 'luiz'],
      }
    ];

  void _responder() {
    if(selectedAnswer) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get selectedAnswer {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
  
    List<String> respostas = selectedAnswer 
    ? _perguntas[_perguntaSelecionada].cast()['respostas']:
    [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: selectedAnswer ? Column(
          children: <Widget>[
            Question(_perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Answer(t, _responder)).toList(),
          ],
        ) 
        : Results()
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}