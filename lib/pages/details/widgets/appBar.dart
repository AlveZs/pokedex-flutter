import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon.dart';

class AppBarDetails extends StatelessWidget {
  final Pokemon pokemon;
  const AppBarDetails({
    super.key, required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 150,
      // color: Color.fromARGB(255, 255, 234, 148),
      child: Column(
        children: [
    
          //Linha dos botões.
          Padding(
            padding: const EdgeInsets.only(
              left:  15,
              right: 15,
              top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: true,
                  child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    color: const Color.fromARGB(255, 255, 255, 255),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  color: const Color.fromARGB(255, 255, 255, 255),
                  icon: const Icon(Icons.favorite_outline),
                ),
              ],
            ),
          ),

          

          //Linha do titulo.
          Padding(
            padding: const EdgeInsets.only(left:26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  pokemon.nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left:26),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pokemon.tipo.map((type) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    right: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(10),
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
        ],
      ),
    );
  }
}