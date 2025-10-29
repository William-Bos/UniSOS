import 'package:flutter/material.dart';
import 'cadastro_page.dart';
import 'menuPage.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Splash());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // fundo cinza claro
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment
                  .center, // centraliza filhos horizontalmente
              children: [
                // Logo com imagem personalizada
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/logo.png', // seu logo
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // Título
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Uni'),
                      TextSpan(
                        text: 'SOS',
                        style: TextStyle(color: Color(0xFF3162CA)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // Campo Usuário
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Usuário',
                    fillColor: Color(0xFFE6F0FA), // azul claro
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Campo Senha
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    fillColor: Color(0xFFE6F0FA),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Esqueci a senha centralizado
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Splash()),
                      );
                    },
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: Color(0xFF3162CA)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Botão Entrar
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Color(0xFF3162CA),
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Botão Cadastro
                Center(
                  child: SizedBox(
                    width: 200,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastroPage(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        side: BorderSide(color: Color(0xFF3162CA)),
                      ),
                      child: const Text(
                        'Cadastro',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3162CA),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Lembrar senha centralizado
                Center(
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min, // ocupa só o espaço necessário
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                        activeColor: Color(0xFF3162CA),
                      ),
                      const Text('Lembrar senha'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
