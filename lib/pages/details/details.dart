import 'package:flutter/material.dart';
import 'package:pokedex_flutter/consts/constPoke.dart';
import 'package:pokedex_flutter/consts/constsApp.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/pages/details/widgets/appBar.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    const double tamanhoDoQuadrado = 150;
    const double tamanhoDaPokebola = 200;
    const double tamanhoDosCirculos = 60;
    const double tamanhoDoPokemon = 180;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Color corBase = constPoke.obterColorPeloTipo(type: pokemon.tipo[0]);
    Color corMaisClara = corBase.withOpacity(0.8);

    return Scaffold(
      body: Stack(children: [
        //Tela.
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                corBase,
                corMaisClara,
              ],
            ),
          ),
          child: Column(
            children: [
              //Espaçamento.
              const SizedBox(height: 30),

              //Appbar
              AppBarDetails(pokemon: pokemon),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 45,
                        left: screenWidth * 0.2,
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          ConstsApp.whiteCircles,
                          height: tamanhoDosCirculos,
                          width: tamanhoDosCirculos,
                        ),
                      ),
                    ),

                    //Imagem da Pokébola.
                    Positioned(
                      bottom: screenHeight * 0.7 - tamanhoDoQuadrado - 30,
                      right: -tamanhoDaPokebola / 8,
                      child: Opacity(
                        opacity: .2,
                        child: Image.asset(
                          ConstsApp.whitePokeball,
                          height: tamanhoDaPokebola,
                          width: tamanhoDaPokebola,
                        ),
                      ),
                    ),

                    Container(
                      height: screenHeight * 0.7 - tamanhoDoQuadrado,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                    ),

                    //Imagem do Pokémon.
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: screenHeight * 0.7 - tamanhoDoQuadrado - 40,
                      ),
                      child: Image.asset(
                        pokemon.hire,
                        height: tamanhoDoPokemon,
                        width: tamanhoDoPokemon,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
