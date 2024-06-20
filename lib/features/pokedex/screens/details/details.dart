import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/consts/constPoke.dart';
import 'package:pokedex_flutter/common/consts/constPaths.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/widgets/appBar.dart';

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
    Color corBase = pokemon.corBase;
    Color corMaisClara = corBase.withOpacity(0.8);

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
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

              Stack(
                children: [
                  Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height/3,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.5,
                      minChildSize: 0.5,
                      maxChildSize: 0.8,
                      builder: (context, scrollController) {
                        return Container(
                          color: Colors.blue,
                        );
                      }
                    ),
                  )
                ]
              ),

              // Stack(
              //   children: [
                  
              //     //Imagem dos circulos.
              //     Padding(
              //       padding: EdgeInsets.only(
              //         top: 45,
              //         left: screenWidth * 0.2,
              //       ),
              //       child: Opacity(
              //         opacity: 0.1,
              //         child: Image.asset(
              //           ConstsApp.whiteCircles,
              //           height: tamanhoDosCirculos,
              //           width: tamanhoDosCirculos,
              //         ),
              //       ),
              //     ),         
                  
                  // Row(
                  //   children: [
                  //     Container(
                  //       height: 200,
                  //       decoration: const BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.vertical(
                  //           top: Radius.circular(15),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  
                  //Imagem do Pokémon.
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 20,
                  //   ),
                  //   child: Center(
                  //     child: Image.asset(
                  //       pokemon.hire,
                  //       height: tamanhoDoPokemon,
                  //       width: tamanhoDoPokemon,
                  //     ),
                  //   ),
                  // ),
                            
                  //Imagem da Pokébola.
        //           Padding(
        //             padding: EdgeInsets.only(
        //               left: screenWidth - tamanhoDaPokebola * 0.6,
        //               top: 0,
        //             ),
        //             child: OverflowBox(
        //               maxHeight: 200,
        //               maxWidth: 200,
        //               child: Opacity(
        //                 opacity: 0.2,
        //                 child: Image.asset(
        //                   ConstsApp.whitePokeball,
        //                   height: tamanhoDaPokebola,
        //                   width: tamanhoDaPokebola,
        //                 ),
        //               ),
        //             ),
        //           ),
                            
                ]
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
                    ConstPath.whiteSquare,
                    height: tamanhoDoQuadrado * 0.8,
                    width: tamanhoDoQuadrado,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}