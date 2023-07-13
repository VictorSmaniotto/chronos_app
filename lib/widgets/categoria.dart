import 'package:flutter/material.dart';

class CategoriaCard extends StatelessWidget {
  final String nome;
  const CategoriaCard({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        nome,
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
