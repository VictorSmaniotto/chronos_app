import 'package:chronos_app/Pages/home_page.dart';
import 'package:flutter/material.dart';

import '../helpers/auth.dart';
import 'cadastrar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      bool isLogado =
          await Auth.login(emailController.text, passwordController.text);
      if (isLogado) {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('usuário ou senha inválido'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Login'),
        backgroundColor: const Color(0xFF0052A1),
        elevation: 1,
        title: Image.asset(
          'assets/logo-branca.png',
          width: 120,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 80),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset('assets/logoChronos.png'),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Acesse sua Conta',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0052A1)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "E-mail"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor, informe o e-mail";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Senha"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor, informe a senha";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loginUser,
                    child: const Text("Entrar"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Não tem uma conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastrarPage(),
                      ),
                    );
                  },
                  child: const Text('Cadastre-se'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
