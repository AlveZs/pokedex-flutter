import 'package:flutter/material.dart';
import 'package:pokedex_flutter/consts/constPoke.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/pages/details/widgets/aboutTab.dart';
import 'package:pokedex_flutter/pages/details/widgets/appBarSliver.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Color corBase = constPoke.obterColorPeloTipo(type: pokemon.tipo[0]);
    final SliverOverlapAbsorberHandle appBarHandler =
        SliverOverlapAbsorberHandle();

    return Scaffold(
      body: Stack(children: [
        //Tela.
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverOverlapAbsorber(
                handle: appBarHandler,
                sliver: AppBarDetails(pokemon: pokemon),
              ),
              SliverPersistentHeader(
                pinned: false,
                floating: false,
                delegate: PokemonHeaderDelegate(
                  toolBarHeight: screenHeight * 0.1,
                  closedHeight: screenHeight * 0.25,
                  openHeight: screenHeight * 0.3,
                  corBase: corBase,
                  pokemon: pokemon,
                ),
              ),
            ],
            body: Builder(builder: (BuildContext context) {
              return MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(handle: appBarHandler),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: AboutPokemon(pokemon: pokemon),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ]),
    );
  }
}

class PokemonHeaderDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  double closedHeight;
  double openHeight;
  Color corBase;
  final Pokemon pokemon;

  PokemonHeaderDelegate({
    required this.toolBarHeight,
    required this.closedHeight,
    required this.openHeight,
    required this.pokemon,
    required this.corBase,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: toolBarHeight + openHeight,
      color: corBase,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
              ),

              //Imagem do Pokémon.
              Image.asset(
                pokemon.hire,
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => toolBarHeight + openHeight;

  @override
  double get minExtent => toolBarHeight + closedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
