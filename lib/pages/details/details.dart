import 'package:flutter/material.dart';
import 'package:pokedex_flutter/consts/constPoke.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/pages/details/widgets/appBar.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;
  
  const DetailsPage({super.key, required this.pokemon});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constPoke.obterColorPeloTipo(type: pokemon.tipo[0]),

      body: Column(
        children: [

          //Espaçamento.
          const SizedBox(height: 30),

          //Appbar
          AppBarDetails(pokemon: pokemon),
        ],
      ),
    );
  }
}