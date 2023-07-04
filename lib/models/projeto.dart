class Projeto {
  final int id;
  final String titulo;
  final String descricao;
  final int situacao;
  final String capa;
  final int categoriaId;
  final String categoriaNome;

  Projeto(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.situacao,
      required this.capa,
      required this.categoriaId,
      required this.categoriaNome});

  factory Projeto.fromJson(Map<String, dynamic> json) {
    return Projeto(
        id: json['id'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        situacao: json['situacao'],
        capa: json['capa'],
        categoriaId: json['categoriaId'],
        categoriaNome: json['categoriaNome']);
  }
}

//continuar puxando a API de projetos
