import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/error/failure.dart';
import 'package:pokedex_flutter/common/repository/pokeRepository.dart';
import 'package:pokedex_flutter/common/widgets/error.dart';
import 'package:pokedex_flutter/common/widgets/loading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/details_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.repository,
    required this.onItemTap,
  });
  final IPokeRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repository.obterTodosPokemons(), //Carrega todos os Pokémons válidos do JSON.
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return LoadingDefault();
        }
        else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return HomePage(pokemons: snapshot.data!, onItemTap: onItemTap);
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