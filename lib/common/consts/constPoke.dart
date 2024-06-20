import 'package:flutter/material.dart';

// ignore: camel_case_types
class constColorType {
  
  static Color obterCorBase({required List<dynamic> tipos}) {
    String tipoSelecionado = _selecionarTipo(tipos);
    return obterColorPeloTipo(type: tipoSelecionado);
  }

  static String _selecionarTipo(List<dynamic> tipos) {
    if (tipos.length > 1 && tipos[0] == 'Normal') {
      return tipos[1];
    }
    return tipos[0];
  }

  static Color obterColorPeloTipo({required String type}) {
    switch (type) {
      case 'Normal':
        return const Color.fromARGB(255, 174, 174, 174);
      case 'Fire':
        return const Color.fromARGB(255, 247, 120, 107);
      case 'Water':
        return const Color.fromARGB(255, 88, 170, 246);
      case 'Grass':
        return const Color.fromARGB(255, 79, 193, 166);
      case 'Electric':
        return const Color.fromARGB(255, 255, 206, 75);
      case 'Ice':
        return const Color.fromARGB(255, 94, 216, 240);
      case 'Fighting':
        return const Color.fromARGB(255, 255, 152, 101);
      case 'Poison':
        return const Color.fromARGB(255, 185, 127, 201);
      case 'Ground':
        return const Color.fromARGB(255, 177, 115, 108);
      case 'Flying':
        return Color.fromARGB(255, 108, 210, 208);
      case 'Psychic':
        return const Color.fromARGB(255, 242, 101, 184);
      case 'Bug':
        return const Color.fromARGB(255, 143, 203, 127);
      case 'Rock':
        return const Color.fromARGB(255, 205, 166, 97);
      case 'Ghost':
        return const Color.fromARGB(255, 124, 83, 140);
      case 'Dark':
        return const Color.fromARGB(255, 112, 112, 112);
      case 'Dragon':
        return const Color.fromARGB(255, 234, 126, 126);
      case 'Steel':
        return const Color.fromARGB(255, 221, 221, 221);
      case 'Fairy':
        return const Color.fromARGB(255, 253, 185, 233);
      default:
        return const Color.fromARGB(255, 211, 211, 211);
    }
  }
}