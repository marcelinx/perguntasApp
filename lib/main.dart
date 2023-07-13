import 'package:flutter/material.dart';
import './quiz.dart';
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: selectedAnswer 
        ? Quiz(
          perguntas: _perguntas,
          perguntaSelecionada: _perguntaSelecionada,
          quantoResponder: _responder,
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