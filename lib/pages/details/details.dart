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
    const double tamanhoDaPokebola = 170;
    const double tamanhoDosCirculos = 60;
    const double tamanhoDoPokemon = 180;
    double screenWidth = MediaQuery.of(context).size.width;
    Color corBase = constPoke.obterColorPeloTipo(type: pokemon.tipo[0]);
    Color corMaisClara = corBase.withOpacity(0.8);

    return Scaffold(
      body: Stack(
        children: [
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
                child: Container(
                  height: 190,
                  width: screenWidth,
                  // color: Colors.red,
                  child: Stack(
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
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth - tamanhoDaPokebola * 0.6,
                          top: 90,
                        ),
                        child: OverflowBox(
                          maxWidth: 200,
                          maxHeight: 200,
                          child: Opacity(
                            opacity: 0.2,
                            child: Image.asset(
                              ConstsApp.whitePokeball,
                              height: tamanhoDaPokebola,
                              width: tamanhoDaPokebola,
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      //Imagem do POkémon.
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Center(
                          child: Image.asset(
                            pokemon.hire,
                            height: tamanhoDoPokemon,
                            width: tamanhoDoPokemon,
                          ),
                        ),
                      ),
                
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),

          //Imagem do quadrado ao fundo.
          Positioned(
            top: -(tamanhoDoQuadrado * 0.25),
            right: screenWidth - (tamanhoDoQuadrado / 1.6),
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.06,
                child: Transform.rotate(
                  angle: -0.25,
                  child: Image.asset(
                    ConstsApp.whiteSquare,
                    height: tamanhoDoQuadrado * 0.8,
                    width: tamanhoDoQuadrado,
                  ),
                ),
              ),
            ),
          ),

        ]
      ),
    );
  }
}