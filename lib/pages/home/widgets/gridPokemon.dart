import 'package:flutter/material.dart';
import 'package:pokedex_flutter/consts/constPoke.dart';
import 'package:pokedex_flutter/consts/constsApp.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex_flutter/pages/details/details.dart';
import 'package:pokedex_flutter/utils/sharedPrefs.dart';

class PokeGrid extends StatelessWidget {
  const PokeGrid({super.key, required this.isFavoriteActive});

  final bool isFavoriteActive;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<int>favoriteIds = SharedPrefs().favorites.map((id) => int.parse(id)).toList();
    // Calcular o número de colunas com base na largura da tela
    double minColumnWidth = 221;
    int numColunas = (screenWidth / minColumnWidth).floor();
    numColunas =
        numColunas > 1 ? numColunas : 2; // garantir um mínimo de 2 colunas

    return FutureBuilder<List<Pokemon>>(
      future: Pokemon.loadPokemons(
        ids: isFavoriteActive ? favoriteIds : []
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar os Pokémons.'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum Pokémon encontrado.'));
        }

        List<Pokemon> pokemons = snapshot.data!;

        return Expanded(
          child: AnimationLimiter(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              addAutomaticKeepAlives: true,
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 24,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: numColunas,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.6,
              ),
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  child: AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: numColunas,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(pokemon: pokemons[index])
                              ),
                            );
                          },

                          //PokeCard
                          child: PokeItem(
                            index: index,
                            pokemons: pokemons,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class PokeItem extends StatelessWidget {
  final int index;
  final List<Pokemon> pokemons;

  const PokeItem({
    super.key,
    required this.index,
    required this.pokemons,
  });

  @override
  Widget build(BuildContext context) {
    const double bordaRadius = 18;
    Color corBase = constPoke.obterColorPeloTipo(type: pokemons[index].tipo[0]);
    Color corMaisClara = corBase.withOpacity(0.8);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(bordaRadius)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              corBase,
              corMaisClara,
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(bordaRadius),
          child: Stack(
            children: [
              //Imagem da Pokebola.
              Padding(
                padding: const EdgeInsets.only(
                  left: 120,
                  top: 70,
                ),
                child: OverflowBox(
                  maxWidth: 200, // Aumentar o tamanho da pokebola
                  maxHeight: 200,
                  child: Opacity(
                    opacity: 0.2,
                    child: Transform.rotate(
                      angle: -0.45,
                      child: Image.asset(
                        ConstsApp.whitePokeball,
                        width: 140,
                        height: 140,
                      ),
                    ),
                  ),
                ),
              ),

              //Nome do Pokemon.
              Padding(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth / 15,
                  top: constraints.maxHeight / 10,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    pokemons[index].nome,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxWidth / 10,
                    ),
                  ),
                ),
              ),

              //Tipos do Pokemon.
              Padding(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth / 15,
                  top: constraints.maxHeight / 3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemons[index].tipo.map((type) {
                    return Container(
                      margin: const EdgeInsets.only(top: 5),
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
                          fontSize: 12,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              //Imagem do Pokemon.
              Positioned(
                bottom: 5,
                right: 15,
                child: Image.asset(
                  pokemons[index].hire,
                  width: constraints.maxWidth / 2.5,
                  height: constraints.maxWidth / 2.5,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
