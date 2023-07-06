import 'package:chronos_app/Pages/login_page.dart';
import 'package:chronos_app/models/projeto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../helpers/api_url.dart';
import '../widgets/menu_drawer.dart';
import 'dart:convert';

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

  @override
  void initState() {
    super.initState();
    _listarProjetos = carregarProjetos();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0052A1),
        elevation: 1,
        title: Image.asset(
          'assets/logo-branca.png',
          width: 120,
        ),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.menu),
        // ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
        ],
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Projeto>>(
          future: _listarProjetos,
          builder: (context, snapshotProjetos) {
            if (snapshotProjetos.hasData) {
              final projetos = snapshotProjetos.data;
              return ListView.builder(
                itemCount: projetos?.length,
                itemBuilder: (context, index) {
                  final projeto = projetos![index];
                  return GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: Image.network(
                              projeto.capa,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 0, left: 15, right: 15),
                            child: Text(
                              projeto.titulo,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 15, right: 15, left: 15),
                            child: Text(
                              projeto.descricao,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
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
    );
  }
}
