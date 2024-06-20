import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Pokemon {
  late int id;
  late String dirAssets;
  late String hire;
  late String sprite;
  late String thumb;
  late Map<String, dynamic> dados;
  late String nome;
  late List<dynamic> tipo;
  late String descricao;
  late String especie;
  late String altura;
  late String peso;
  late String genero;
  late List<String> habilidades;
  late int vida;
  late int ataque;
  late int defesa;
  late int ataqueEspecial;
  late int defesaEspecial;
  late int velocidade;
  late int total;
  late dynamic evolucaoPassada;
  late dynamic evolucaoFutura;
  late List<String> ovo;

  Pokemon({
    required this.id,
    this.dirAssets = 'assets/',
  }) {
    // Inicializar atributos opcionais para evitar null pointers
    nome = '';
    tipo = [];
    descricao = '';
    especie = '';
    altura = '';
    peso = '';
    genero = '';
    habilidades = [];
    vida = 0;
    ataque = 0;
    defesa = 0;
    ataqueEspecial = 0;
    defesaEspecial = 0;
    velocidade = 0;
    total = 0;
    evolucaoPassada = [];
    evolucaoFutura = [];
    ovo = [];
  }

  static Future<List<Pokemon>> loadPokemons({List<int> ids= const []}) async {
    try {
      String jsonString = await rootBundle.loadString('assets/pokedex.json');
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<Pokemon> pokemons = [];

      if (ids.isNotEmpty){
        for (int id in ids){
          if (id >= 1 && id <= 809 && jsonList[id - 1] != null) {
          Pokemon pokemon = Pokemon(id: id);
          pokemon.dados = jsonList[id - 1];
          pokemon.nome = pokemon.dados['name']['english'];
          pokemon.tipo = pokemon.dados['type'];
          pokemon.descricao = pokemon.dados['description'];
          pokemon.hire =
              "${pokemon.dirAssets}images/pokedex/hires/${pokemon.id.toString().padLeft(3, '0')}.png";
          pokemon.sprite =
              "${pokemon.dirAssets}images/pokedex/sprites/${pokemon.id.toString().padLeft(3, '0')}.png";
          pokemon.thumb =
              "${pokemon.dirAssets}images/pokedex/thumbnails/${pokemon.id.toString().padLeft(3, '0')}.png";
          pokemon._loadSobre();
          pokemon._loadStatus();
          pokemon._loadEvolucao();
          pokemons.add(pokemon);
          }
        }
      } else{
          for (int id = 1; id <= 809; id++) {
          // Itera sobre os IDs de 1 a 809
          if (jsonList[id - 1] != null) {
            // Verifica se o JSON contém o Pokémon com o ID atual
            Pokemon pokemon = Pokemon(id: id);
            pokemon.dados = jsonList[id - 1];
            pokemon.nome = pokemon.dados['name']['english'];
            pokemon.tipo = pokemon.dados['type'];
            pokemon.descricao = pokemon.dados['description'];
            pokemon.hire =
                "${pokemon.dirAssets}images/pokedex/hires/${pokemon.id.toString().padLeft(3, '0')}.png";
            pokemon.sprite =
                "${pokemon.dirAssets}images/pokedex/sprites/${pokemon.id.toString().padLeft(3, '0')}.png";
            pokemon.thumb =
                "${pokemon.dirAssets}images/pokedex/thumbnails/${pokemon.id.toString().padLeft(3, '0')}.png";
            pokemon._loadSobre();
            pokemon._loadStatus();
            pokemon._loadEvolucao();
            pokemons.add(pokemon);
          }
        }
      }
      return pokemons;
    } catch (e) {
      return [];
    }
  }

  void _loadSobre() {
    Map<String, dynamic> profile = dados['profile'];
    especie = dados['species'];
    altura = profile['height'];
    peso = profile['weight'];
    genero = profile['gender'];
    ovo = [
      for (String egg in profile['egg']) egg
    ];
    habilidades = [
      for (var ability in profile['ability'])
        ability[0]
    ];
  }

  Map<String, List<dynamic>> getSobreMap() {
    Map<String, List> about = { 'general': [], 'breeding': [] };
    about['general']?.add({
      "label": 'Espécie',
      "data": especie.split(' Pokémon')[0]
    });
    about['general']?.add({"label": 'Altura', "data": altura });
    about['general']?.add({"label": 'Peso', "data": peso });
    about['general']?.add({"label": 'Habilidades', "data": habilidades.join(', ') });
    List<String> generoPokemon = genero.split(':');
    about['gender'] = [{"male": generoPokemon[0], "female": generoPokemon[1] }];
    about['breeding']?.add({
      "label": 'Grupo ovos',
      "data": ovo.asMap().containsKey(1) ? ovo[0] : 'Nenhum'
    });
    about['breeding']?.add({
      "label": 'Ciclo ovos',
      "data": ovo.asMap().containsKey(1) ? ovo[1] : ovo[0]
    });

    return about;
  }

  void _loadStatus() {
    Map<String, dynamic> base = dados['base'];
    vida = base['HP'];
    ataque = base['Attack'];
    defesa = base['Defense'];
    ataqueEspecial = base['Sp. Attack'];
    defesaEspecial = base['Sp. Defense'];
    velocidade = base['Speed'];
    total =
        vida + ataque + defesa + ataqueEspecial + defesaEspecial + velocidade;
  }

  void _loadEvolucao() {
    Map<String, dynamic> evolution = dados['evolution'];
    evolucaoPassada = evolution.containsKey('prev') ? evolution['prev'] : [];
    evolucaoFutura = evolution.containsKey('next') ? evolution['next'] : [];
  }
}
