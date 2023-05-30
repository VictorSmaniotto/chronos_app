import 'package:flutter/material.dart';

class CardProjetos extends StatefulWidget {
  const CardProjetos({super.key});

  @override
  State<CardProjetos> createState() => _CardProjetosState();
}

class _CardProjetosState extends State<CardProjetos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.only(top: 2),
        child: SizedBox(
          height: 370,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/foto3.jpg',
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'HERA - Acelerando o desenvolvimento cognitivo',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0052A1)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'O projeto Hera é busca acelerar o desenvolvimento cognitivo de crianças e adolescentes por meio de atividades práticas e acompanhamento pedagógico especializado, garantindo efetividade e segurança para o bem estar infantil.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
