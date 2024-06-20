import 'package:flutter/material.dart';

class ErrorDefault extends StatelessWidget {
  const ErrorDefault({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Text(
          error,
        ),
      ),
    );
  }
}