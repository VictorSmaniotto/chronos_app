import 'package:flutter/material.dart';

class Categoria extends StatelessWidget {
  final String nomeCategoria;
  const Categoria({super.key, required this.nomeCategoria});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        nomeCategoria,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }
}
