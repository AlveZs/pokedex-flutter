import 'package:flutter/material.dart';
import 'package:pokedex_flutter/consts/constPoke.dart';
import 'package:pokedex_flutter/consts/constsApp.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/pages/details/widgets/aboutTab.dart';
import 'package:pokedex_flutter/pages/details/widgets/appBarSliver.dart';

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

    final SliverOverlapAbsorberHandle appBarHandler =
        SliverOverlapAbsorberHandle();
    final SliverOverlapAbsorberHandle imageHandler =
        SliverOverlapAbsorberHandle();

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
          child: DefaultTabController(
            length: 4,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                  handle: appBarHandler,
                  sliver: AppBarDetails(pokemon: pokemon),
                ),
                SliverOverlapAbsorber(
                  handle: imageHandler,
                  sliver: SliverPersistentHeader(
                    pinned: true,
                    floating: false,
                    delegate: PokemonHeaderDelegate(
                      toolBarHeight: screenHeight * 0.1,
                      closedHeight: screenHeight * 0.25,
                      openHeight: screenHeight * 0.3,
                      corBase: corBase,
                      pokemon: pokemon,
                    ),
                  ),
                ),
              ],
              body: Builder(builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(handle: appBarHandler),
                    SliverOverlapInjector(handle: imageHandler),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Container(
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? screenHeight * 0.5
                            : screenHeight * 0.8,
                        color: Colors.white,
                        child: TabBarView(children: [
                          AboutPokemon(pokemon: pokemon),
                          const Text('Status Base'),
                          const Text('Evolução'),
                          const Text('Ataques'),
                        ]),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ]),
    );
  }
}

class PokemonHeaderDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  //toolBarHeight Included in both
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
          Container(
            color: Colors.white,
            child: const TabBar(
              tabs: [
                Text('Sobre'),
                Text('Status'),
                Text('Evolução'),
                Text('Ataques'),
              ],
              unselectedLabelColor: Color.fromARGB(255, 207, 207, 207),
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              labelPadding: EdgeInsets.only(bottom: 20),
            ),
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
