import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/consts/constPoke.dart';
import 'package:pokedex_flutter/common/consts/constPaths.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

class PokeItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokeItem({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    const double bordaRadius = 18;
    Color corBase = pokemon.corBase;
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
                        ConstPath.whitePokeball,
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
                    pokemon.nome,
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
                  children: pokemon.tipo.map((type) {
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
                  pokemon.hire,
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