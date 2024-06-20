import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pokedex_flutter/common/consts/constPaths.dart';
import 'package:pokedex_flutter/common/error/failure.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

abstract class IPokeRepository{
  Future<List<Pokemon>> obterTodosPokemons();
}

class PokeRepository implements IPokeRepository{
  @override
  Future<List<Pokemon>> obterTodosPokemons() async {
    Pokemon pokemon;
    List<Pokemon> pokemons = [];
    try {
      String jsonString = await rootBundle.loadString(ConstPath.pokedexJSONPath);
      List<dynamic> listJson = jsonDecode(jsonString);

      for (int idx = 1; idx <= 809; idx++) { //No dataset escolhido falta informações usadas apartir do Pokemon 810.
        dynamic jsonData = listJson[idx - 1];
        pokemon = Pokemon.fromJSON(jsonData); //Usando a fabrica para construir cada Pokémon.
        pokemons.add(pokemon);
      }
      return pokemons;
    }catch(e){
      throw Failure(mensagem: 'Não foi possível carregar todos os Pokémons do JSON: $e');
    }
  }
}