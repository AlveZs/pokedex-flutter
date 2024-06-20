import 'package:flutter/material.dart';

class LoadingDefault extends StatelessWidget {
  const LoadingDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: const Color.fromARGB(98, 0, 0, 0),
        ),
    );
  }
}