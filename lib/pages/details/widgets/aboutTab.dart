import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';

class AboutPokemon extends StatelessWidget {
  const AboutPokemon({super.key, required this.pokemon});

  final Pokemon pokemon;

  Widget getLabelText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 194, 193, 193),
        fontSize: 18,
      ),
    );
  }

  Widget getInfoText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List> dadosSobre = pokemon.getSobreMap();

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: dadosSobre['general']?.map((geral) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: getLabelText(geral['label']),
                      ),
                      Expanded(
                        flex: 2,
                        child: getInfoText(geral['data']),
                      ),
                    ],
                  );
                }).toList() ??
                [],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'Breeding',
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: [
              Expanded(flex: 1, child: getLabelText('Gênero')),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.male,
                          color: Colors.blue,
                        ),
                        Text("${dadosSobre['gender']?[0]['male']}%")
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.female,
                          color: Colors.pink,
                        ),
                        Text("${dadosSobre['gender']?[0]['female']}%")
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: dadosSobre['breeding']?.map((breeding) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: getLabelText(breeding['label']),
                      ),
                      Expanded(
                        flex: 2,
                        child: getInfoText(breeding['data']),
                      ),
                    ],
                  );
                }).toList() ??
                [],
          ),
        ],
      ),
    );
  }
}
