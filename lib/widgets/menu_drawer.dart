import 'package:chronos_app/Pages/home_page.dart';
import 'package:chronos_app/Pages/politica_page.dart';
import 'package:chronos_app/Pages/termos_page.dart';
import 'package:flutter/material.dart';

import '../helpers/auth.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0052A1),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 63,
                  child: DrawerHeader(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                      'assets/logo-branca.png',
                      width: 10,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.all_inbox,
                    color: Color(0xFFFFFFFF),
                  ),
                  title: const Text(
                    'Projetos',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person_rounded,
                    color: Color(0xFFFFFFFF),
                  ),
                  title: const Text(
                    'Perfil',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  onTap: () {
                    //Função para abrir a página projetos
                  },
                ),
                // ListTile(
                //   leading: const Icon(
                //     Icons.calendar_month,
                //     color: Color(0xFFFFFFFF),
                //   ),
                //   title: const Text(
                //     'Eventos',
                //     style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                //   ),
                //   onTap: () {
                //     //Função para abrir a página projetos
                //   },
                // ),
                // ListTile(
                //   leading: const Icon(
                //     Icons.article_outlined,
                //     color: Color(0xFFFFFFFF),
                //   ),
                //   title: const Text(
                //     'Mural de Pedidos',
                //     style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                //   ),
                //   onTap: () {
                //     //Função para abrir a página projetos
                //   },
                // ),
                const Divider(
                  color: Colors.white,
                ),
                // ListTile(
                //   title: const Text(
                //     'Ajuda e Suporte',
                //     style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                //   ),
                //   onTap: () {
                //     //Função para abrir a página projetos
                //   },
                // ),
                ListTile(
                  title: const Text(
                    'Política de Privacidade',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PoliticaPage(),
                      ),
                    );
                  },
                ),

                ListTile(
                    title: const Text(
                      'Termos de Uso',
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermosPage(),
                        ),
                      );
                    }),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.miscellaneous_services_sharp,
                    color: Color(0xFFFFFFFF),
                  ),
                  title: const Text(
                    'Configurações',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  onTap: () {
                    //Função para abrir a página projetos
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                    color: Color(0xFFFFFFFF),
                  ),
                  title: const Text(
                    'Sair',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  onTap: () {
                    Auth.logout(context);
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Versão 1.0.0',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
