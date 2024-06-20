import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pokemon, required this.pokemons});
  final Pokemon pokemon;
  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: ListView(
                children: pokemons.map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e.nome),
                )).toList(),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}