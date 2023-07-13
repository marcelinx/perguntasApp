import 'package:flutter/material.dart';

class Results extends StatelessWidget {

  final int pontuacao;

 Results(this.pontuacao);

 String get fraseResultado {
   if(pontuacao < 4) {
     return 'Nossa, amorrrrr';
   } else if(pontuacao < 18) {
     return 'A gente pode melhorar, né';
   } else if(pontuacao < 24 ){
     return 'Urru, mas tá quase lá';
   } else{
     return 'Te amo, casa comigo';
   }
 }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
        fraseResultado,
          style: TextStyle(fontSize: 28),
      ),
    );
  }
}