
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/consts/constPaths.dart';
import 'package:pokedex_flutter/common/consts/constPoke.dart';

class Pokemon {
  late int id;
  late String num;
  late String hire;
  late String sprite;
  late String thumb;
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
  late Color corBase;
  late List<dynamic> ovos;

  factory Pokemon.fromJSON(dynamic json){
    Map<String, dynamic> profile = json['profile'];
    Map<String, dynamic> base = json['base'];
    Map<String, dynamic> evolution = json['evolution'];
    List<String> habilidades = [for (var ability in profile['ability']) if (ability[1] == "true") ability[0]];
    int id = json['id'];
    String num = id.toString().padLeft(3, '0');
    int vida = base['HP'] ?? 0;
    int ataque = base['Attack'] ?? 0;
    int defesa = base['Defense'] ?? 0;
    int ataqueEspecial = base['Sp. Attack'] ?? 0;
    int defesaEspecial = base['Sp. Defense'] ?? 0;
    int velocidade = base['Speed'] ?? 0;
    List<dynamic> tipo = json['type'] ?? [];

    return Pokemon(
      id: id,
      num: num,
      nome: json['name']['english'],
      hire: "${ConstPath.hiresPath}${num}.png",
      sprite: "${ConstPath.spritesPath}${num}.png",
      thumb: "${ConstPath.thumbnailsPath}${num}.png",
      tipo: tipo,
      descricao: json['description'] ?? 'Sem descrição',
      especie: profile['species'] ?? 'Desconhecida',
      altura: profile['height'] ?? 'Desconhecida',
      peso: profile['weight'] ?? 'Desconhecido',
      genero: profile['gender'] ?? 'Desconhecido',
      ovo: profile['eggs'] ?? [],
      habilidades: habilidades,
      vida: vida,
      ataque: ataque,
      defesa: defesa,
      ataqueEspecial: ataqueEspecial,
      defesaEspecial: defesaEspecial,
      velocidade: velocidade,
      total: vida + ataque + defesa + ataqueEspecial + defesaEspecial + velocidade,
      evolucaoPassada:  evolution.containsKey('prev') ? evolution['prev'] : [],
      evolucaoFutura: evolution.containsKey('next') ? evolution['next'] : [],
      corBase: constColorType.obterCorBase(tipos: tipo),
    );
  }

  Pokemon({
    required this.id,
    required this.num,
    required this.hire,
    required this.sprite,
    required this.thumb,
    required this.nome,
    required this.tipo,
    required this.descricao,
    required this.especie,
    required this.altura,
    required this.peso,
    required this.genero,
    required this.habilidades,
    required this.vida,
    required this.ataque,
    required this.defesa,
    required this.ataqueEspecial,
    required this.defesaEspecial,
    required this.velocidade,
    required this.total,
    required this.evolucaoPassada,
    required this.evolucaoFutura,
    required this.corBase, required ovo,
  });
}
