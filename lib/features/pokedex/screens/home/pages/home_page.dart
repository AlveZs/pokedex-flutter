import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/consts/constPaths.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/details_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/widgets/appBar.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/widgets/pokeGrid.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.pokemons, required this.onItemTap});
  final List<Pokemon> pokemons;
  final Function(String, DetailArguments) onItemTap;

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
              child: 
                Image.asset(
                ConstPath.darkPokeball,
                height: tamanhoDaPokebola,
                width: tamanhoDaPokebola,
                ),
            )
          ),

          Column(
            children: [
          
              //Espaçamento.
              SizedBox(height: 30),
          
              //AppBar titulo e menuButton.
              AppBarHome(),

              //Grid.
              PokeGrid(pokemons: pokemons, onItemTap: onItemTap),
              
            ],
          ),
        ],
      ),
    );
  }
}


