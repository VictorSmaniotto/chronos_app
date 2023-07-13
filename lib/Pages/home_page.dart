import 'package:chronos_app/Pages/webview_page.dart';
import 'package:chronos_app/models/projeto.dart';
import 'package:chronos_app/models/categoria.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../helpers/api_url.dart';
import '../helpers/auth.dart';
import '../widgets/menu_drawer.dart';
import 'dart:convert';

import 'login_page.dart';
// Import for Android features.
// Import for iOS features.

// Colors
//Color(0xFF004A8D)
//Color(0xFF0E6094)
//Color(0xFF0052A1)
//Color(0xFF004587)

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Projeto>> _listarProjetos;
  late Future<List<Categoria>> _listarCategorias;
  String? _foto;

  @override
  void initState() {
    super.initState();
    _listarProjetos = carregarProjetos();
    carregarFoto();
    _listarCategorias = carregarCategorias();
  }

  void carregarFoto() {
    Auth.carregarFoto().then((foto) {
      setState(() {
        _foto = foto;
      });
    });
  }

  Future<void> filtrarProjetos(
      {int? categoriaId, String? termoPesquisa}) async {
    _listarProjetos = carregarProjetos();
    if (categoriaId != null) {
      setState(() {
        _listarProjetos = _listarProjetos.then((projetos) => projetos
            .where((projeto) => projeto.categoriaId == categoriaId)
            .toList());

        selecionado++;
        if (selecionado > 1) {
          _listarProjetos = carregarProjetos();
          selecionado = 0;
          _categoriaSelecionada = -1;
        }
      });
    }

    // if (_categoriaSelecionada >= 0) {
    //   setState(() {
    //     _listarProjetos = _listarProjetos.then((projetos) => projetos
    //         .where((projeto) => projeto.categoriaId == categoriaId)
    //         .toList());
    //     _categoriaSelecionada = -1;
    //   });
    // }
    debugPrint(_categoriaSelecionada.toString());
    if (termoPesquisa != null && termoPesquisa.isNotEmpty) {
      setState(() {
        _listarProjetos = _listarProjetos.then((projetos) => projetos
            .where(
              (projeto) =>
                  projeto.titulo
                      .toLowerCase()
                      .contains(termoPesquisa.toLowerCase()) ||
                  projeto.descricao.toLowerCase().contains(
                        termoPesquisa.toLowerCase(),
                      ),
            )
            .toList());
      });
    }
  }

  Future<List<Projeto>> carregarProjetos() async {
    final response = await http.get(Uri.parse("${ApiUrl.baseUrl}/projetos"));

    if (response.statusCode == 200) {
      List listaProjetos = json.decode(response.body);
      List<Projeto> projetos =
          listaProjetos.map((projeto) => Projeto.fromJson(projeto)).toList();

      return projetos;
    } else {
      throw Exception('Falha ao carregar os Projetos');
    }
  }

  Future<List<Categoria>> carregarCategorias() async {
    final response = await http.get(Uri.parse("${ApiUrl.baseUrl}/categorias"));

    if (response.statusCode == 200) {
      List listaCategorias = json.decode(response.body);

      List<Categoria> categorias = listaCategorias
          .map((categoria) => Categoria.fromJson(categoria))
          .toList();

      return categorias;
    } else {
      throw Exception('Falha ao carregar as categorias');
    }
  }

  Icon searchIcon = const Icon(Icons.search);
  Widget titulo = Image.asset(
    'assets/logo-branca.png',
    width: 120,
  );
  int _categoriaSelecionada = -1;
  int selecionado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0052A1),
          elevation: 1,
          title: titulo,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (searchIcon.icon == Icons.search) {
                      searchIcon = const Icon(Icons.cancel);
                      titulo = ListTile(
                        leading: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ),
                        title: TextField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Pesquisar projetos',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                          ),
                          onSubmitted: (texto) {
                            filtrarProjetos(termoPesquisa: texto);
                          },
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    } else {
                      searchIcon = const Icon(Icons.search);
                      titulo = Image.asset(
                        'assets/logo-branca.png',
                        width: 120,
                      );
                    }
                  });
                },
                icon: searchIcon),
            if (_foto != null) ...[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(_foto!),
                ),
              ),
            ] else ...[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person_rounded)),
            ]
          ],
        ),
        drawer: const MenuDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Categoria>>(
                future: _listarCategorias,
                builder: (context, snapshotCategorias) {
                  if (snapshotCategorias.hasData) {
                    final categorias = snapshotCategorias.data;
                    return SizedBox(
                      height:
                          50, // Defina uma altura explícita para limitar o widget pai
                      child: ListView.builder(
                        itemCount: categorias?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final categoria = categorias![index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _categoriaSelecionada =
                                    index; // Armazena o índice da categoria selecionada
                              });
                              filtrarProjetos(categoriaId: categoria.id ?? -1);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Chip(
                                label: Text(
                                  categoria.nome!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // backgroundColor: Colors.blue,
                                backgroundColor: _categoriaSelecionada == index
                                    ? Colors.orange
                                    : Colors
                                        .blue, // Define a cor de fundo do Chip com base na categoria selecionada
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshotCategorias.hasError) {
                    debugPrint("${snapshotCategorias.error}");
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 5, right: 5),
                child: FutureBuilder<List<Projeto>>(
                  future: _listarProjetos,
                  builder: (context, snapshotProjetos) {
                    if (snapshotProjetos.hasData) {
                      final projetos = snapshotProjetos.data;
                      if (projetos!.isEmpty) {
                        return const Center(
                          child: Text('Nenhum projeto encontrado'),
                        );
                      }
                      return ListView.builder(
                        itemCount: projetos.length,
                        itemBuilder: (context, index) {
                          final projeto = projetos[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebViewPage(
                                    projeto: projeto.link.toString(),
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.only(bottom: 20, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 180,
                                    width: double
                                        .infinity, // Defina uma largura explícita para a imagem
                                    child: Image.network(
                                      projeto.capa,
                                      fit: BoxFit
                                          .cover, // Ajuste a imagem ao tamanho do contêiner
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      projeto.titulo,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      projeto.descricao,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshotProjetos.hasError) {
                      debugPrint("${snapshotProjetos.error}");
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
