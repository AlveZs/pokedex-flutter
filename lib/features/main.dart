import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/repository/pokeRepository.dart';
import 'package:pokedex_flutter/features/pokedex/screens/route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokedexRoute(
        repository: PokeRepository(),
      )
    );
  }
}