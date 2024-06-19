import 'package:flutter/material.dart';
import 'package:pokedex_flutter/consts/constPoke.dart';
import 'package:pokedex_flutter/models/pokemon.dart';

class AppBarDetails extends StatelessWidget {
  final Pokemon pokemon;
  const AppBarDetails({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final Color corBase = constPoke.obterColorPeloTipo(type: pokemon.tipo[0]);

    return SliverAppBar(
      pinned: true,
      surfaceTintColor: corBase,
      expandedHeight: 140,
      backgroundColor: corBase,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actions: [
        IconButton(
          // ignore: avoid_print
          onPressed: () {
            print('Tamanho da tela: $screenHeight]');
          },
          color: const Color.fromARGB(255, 255, 255, 255),
          icon: const Icon(Icons.favorite_outline),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pokemon.nome,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Google',
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                      PokemonTypes(pokemon: pokemon)
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
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
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PokemonTypes extends StatelessWidget {
  const PokemonTypes({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
