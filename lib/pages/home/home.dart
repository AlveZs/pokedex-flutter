import 'package:flutter/material.dart';
import 'package:pokedex_flutter/consts/constsApp.dart';
import 'package:pokedex_flutter/pages/home/widgets/appBar.dart';
import 'package:pokedex_flutter/pages/home/widgets/gridPokemon.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


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
                ConstsApp.darkPokeball,
                height: tamanhoDaPokebola,
                width: tamanhoDaPokebola,
                ),
            )
          ),

          const Column(
            children: [
          
              //Espaçamento.
              SizedBox(height: 30),
          
              //AppBar titulo e menuButton.
              AppBarHome(),

              //Grid.
              PokeGrid(),

            ],
          ),
        ],
      ),
    );
  }
}


