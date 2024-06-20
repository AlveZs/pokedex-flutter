import 'package:flutter/material.dart';
import 'package:pokedex_flutter/consts/constsApp.dart';
import 'package:pokedex_flutter/pages/home/widgets/appBar.dart';
import 'package:pokedex_flutter/pages/home/widgets/gridPokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFavoriteActive = false;

  void toggleFavoriteFilter() {
    setState(() {
      _isFavoriteActive = !_isFavoriteActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double tamanhoDaPokebola = 240;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          //Imagem da pokebola ao fundo
          Positioned(
              top: -(tamanhoDaPokebola * 0.25),
              left: screenWidth - (tamanhoDaPokebola / 1.55),
              child: Opacity(
                opacity: 0.05,
                child: Image.asset(
                  ConstsApp.darkPokeball,
                  height: tamanhoDaPokebola,
                  width: tamanhoDaPokebola,
                ),
              )),

          Column(
            children: [
              //Espaçamento.
              const SizedBox(height: 30),

              //AppBar titulo e menuButton.
              AppBarHome(
                isFavoriteActive: _isFavoriteActive,
                onChangeFilter: toggleFavoriteFilter,
              ),

              //Grid.
              PokeGrid(isFavoriteActive: _isFavoriteActive),
            ],
          ),
        ],
      ),
    );
  }
}
