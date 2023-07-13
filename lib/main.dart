import 'package:flutter/material.dart';
import './quiz.dart';
import 'results.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
      {
        'texto': 'quer namorar comigo?',
        'respostas': [
          {'texto': 'sim', 'pontuacao': 6}, 
          {'texto': 'com certeza', 'pontuacao': 10}, 
          {'texto': 'claro', 'pontuacao': 8}, 
          {'texto': 'nao', 'pontuacao': 1},
          ]
      }, 
      {
        'texto': 'quer casar comigo?',
        'respostas': [
          {'texto': 'sim', 'pontuacao': 6}, 
          {'texto': 'com certeza', 'pontuacao': 10}, 
          {'texto': 'claro', 'pontuacao': 8}, 
          {'texto': 'nao', 'pontuacao': 1},
          ],
      }, 
      {
        'texto': 'como voce deve chamar seu namorado?',
        'respostas': [
          {'texto': 'amor', 'pontuacao': 6}, 
          {'texto': 'vida', 'pontuacao': 8}, 
          {'texto': 'meu tudão', 'pontuacao': 10}, 
          {'texto': 'luiz', 'pontuacao': 1},
          ],
      }
    ];
    
  void _responder(int pontuacao) {
    if(selectedAnswer) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
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
        : Results(_pontuacaoTotal)
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}