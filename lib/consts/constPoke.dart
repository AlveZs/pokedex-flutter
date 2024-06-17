// ignore_for_file: dead_code

import 'package:flutter/material.dart';

// ignore: camel_case_types
class constPoke {

    static Color obterColorPeloTipo({required String type}) {
    switch (type) {
      case 'Normal':
        return const Color.fromARGB(255, 174, 174, 174);
      case 'Fire':
        return const Color.fromARGB(255, 247, 120, 107);
        break;
      case 'Water':
        return const Color.fromARGB(255, 88, 170, 246);
        break;
      case 'Grass':
        return const Color.fromARGB(255, 79, 193, 166);
        break;
      case 'Electric':
        return const Color.fromARGB(255, 255, 206, 75);
        break;
      case 'Ice':
        return const Color.fromARGB(255, 94, 216, 240);
        break;
      case 'Fighting':
        return const Color.fromARGB(255, 255, 152, 101);
        break;
      case 'Poison':
        return const Color.fromARGB(255, 185, 127, 201);
        break;
      case 'Ground':
        return const Color.fromARGB(255, 177, 115, 108);
        break;
      case 'Flying':
        return const Color.fromARGB(255, 155, 249, 247);
        break;
      case 'Psychic':
        return const Color.fromARGB(255, 242, 101, 184);
        break;
      case 'Bug':
        return const Color.fromARGB(255, 143, 203, 127);
        break;
      case 'Rock':
        return const Color.fromARGB(255, 205, 166, 97);
        break;
      case 'Ghost':
        return const Color.fromARGB(255, 124, 83, 140);
        break;
      case 'Dark':
        return const Color.fromARGB(255, 112, 112, 112);
        break;
      case 'Dragon':
        return const Color.fromARGB(255, 234, 126, 126);
        break;
      case 'Steel':
        return const Color.fromARGB(255, 221, 221, 221);
        break;
      case 'Fairy':
        return const Color.fromARGB(255, 253, 185, 233);
        break;
      default:
        return const Color.fromARGB(255, 211, 211, 211);
        break;
    }
  }

}