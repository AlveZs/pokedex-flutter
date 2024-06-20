import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/repository/pokeRepository.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/details_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({super.key, required this.repository});
  final PokeRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if(settings.name=='/'){
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route , arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            }
          );
        }
        if(settings.name=='/details'){
          return MaterialPageRoute(
            builder: (context) {
              return DetailsContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
              );
            }
          );
        }
        return null;
      },
    );
  }
}