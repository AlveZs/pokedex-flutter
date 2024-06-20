import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/details_container.dart';
//import 'package:pokedex_flutter/features/pokedex/screens/details/details.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/widgets/pokeItem.dart';

class PokeGrid extends StatelessWidget {
  const PokeGrid({super.key, required this.pokemons, required this.onItemTap});
  final List<Pokemon> pokemons;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Calcular o número de colunas com base na largura da tela
    double minColumnWidth = 221;
    int numColunas = (screenWidth / minColumnWidth).floor();
    numColunas =
        numColunas > 1 ? numColunas : 2; // garantir um mínimo de 2 colunas

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
                        onItemTap('/details', DetailArguments(pokemon: pokemons[index]));
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailsPage(pokemon: pokemons[index])
                        //   ),
                        // );
                      },

                      //PokeCard
                      child: PokeItem(pokemon: pokemons[index]),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
