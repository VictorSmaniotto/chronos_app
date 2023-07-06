class Projeto {
  final int id;
  final String titulo;
  final String descricao;
  final String capa;
  final int categoriaId;
  final String categoriaNome;
  final String link;

  Projeto(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.capa,
      required this.categoriaId,
      required this.categoriaNome,
      required this.link});

  factory Projeto.fromJson(Map<String, dynamic> json) {
    return Projeto(
        id: json['id'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        capa: json['capa'],
        categoriaId: json['categoria_id'],
        categoriaNome: json['categoria_nome'],
        link: json['link']);
  }
}

//continuar puxando a API de projetos
