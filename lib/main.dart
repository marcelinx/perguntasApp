import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
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

    List<String> respostas = perguntas[_perguntaSelecionada].cast()['respostas'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Question(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Answer(t, _responder)).toList(),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}