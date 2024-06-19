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
                AppBarDetails(pokemon: pokemon),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: PokemonHeaderDelegate(
                    toolBarHeight: screenHeight * 0.15,
                    closedHeight: screenHeight * 0.15,
                    openHeight: screenHeight * 0.15,
                    corBase: corBase,
                    pokemon: pokemon,
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: TabBarDelegate(
                    toolBarHeight: 60,
                    closedHeight: 60,
                    openHeight: 60,
                  ),
                ),
              ],
              body: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(30),
                child: TabBarView(children: [
                  AboutPokemon(pokemon: pokemon),
                  const Text('Status Base'),
                  const Text('Evolução'),
                  const Text('Ataques'),
                ]),
              ),
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
      child: Stack(
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
            height: 180,
            width: 180,
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

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  //toolBarHeight Included in both
  double closedHeight;
  double openHeight;

  TabBarDelegate({
    required this.toolBarHeight,
    required this.closedHeight,
    required this.openHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
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
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
