import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon.dart';

class AppBarDetails extends StatelessWidget {
  final Pokemon pokemon;
  const AppBarDetails({
    super.key, required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 150,
      // color: Color.fromARGB(255, 255, 234, 148),
      child: Column(
        children: [
          //Primeira linha com botões.
          Padding(
            padding: const EdgeInsets.only(
              left:  15,
              right: 15,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: true,
                  //Botão de Retorno.
                  child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    color: const Color.fromARGB(255, 255, 255, 255),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                //Botão de favorito.
                IconButton(
                  // ignore: avoid_print
                  onPressed: (){print('Tamanho da tela: $screenHeight]');},
                  color: const Color.fromARGB(255, 255, 255, 255),
                  icon: const Icon(Icons.favorite_outline),
                ),
              ],
            ),
          ),

          //Segunda linha.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 26,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Nome do Pokémon.
                    Text(
                      pokemon.nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                    
                    // Tipos do Pokémon.
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Row(
                        children: pokemon.tipo.map((type) {
                          return Container(
                            margin: const EdgeInsets.only(top: 0, right: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              type,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Google',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              //Id do Pokémon.
              Padding(
                padding: const EdgeInsets.only(
                  right: 26,
                ),
                child: Column(
                  children: [
                    //Id do Pokémon.
                    Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}