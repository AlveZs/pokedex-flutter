import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
    required this.onChangeFilter,
    required this.isFavoriteActive,
  });

  final void Function() onChangeFilter;
  final bool isFavoriteActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // color: Color.fromARGB(255, 255, 234, 148),
      child: Column(
        children: [
          //Linha dos botões.
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.favorite_outline),
                Switch(
                  activeColor: Colors.pink,
                  value: isFavoriteActive,
                  onChanged: (_) {
                    onChangeFilter();
                  },
                )
                /* IconButton(
                  onPressed: () {
                    onChangeFilter();
                  },
                  color: Colors.black,
                  icon: isFavoriteActive
                      ? const Icon(Icons.)
                      : const Icon(Icons.filter_list),
                ), */
              ],
            ),
          ),

          //Linha do titulo.
          const Padding(
            padding: EdgeInsets.only(left: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Pokédex",
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
