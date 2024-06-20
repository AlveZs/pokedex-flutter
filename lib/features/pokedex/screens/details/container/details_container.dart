import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/error/failure.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repository/pokeRepository.dart';
import 'package:pokedex_flutter/common/widgets/error.dart';
import 'package:pokedex_flutter/common/widgets/loading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments{
  DetailArguments({required this.pokemon});
  final Pokemon pokemon;
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key, required this.repository, required this.arguments});
  final IPokeRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repository.obterTodosPokemons(), //Carrega todos os Pokémons válidos do JSON.
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return LoadingDefault();
        }
        else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return DetailPage(
            pokemon: arguments.pokemon,
            pokemons: snapshot.data!,
            );
        }
        else if (snapshot.hasError){
          return ErrorDefault(
            error:(snapshot.error as Failure).mensagem!,
          );
        }
        return Placeholder();
      },
    );
  }
}