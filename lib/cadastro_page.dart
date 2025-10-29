import 'package:flutter/material.dart';
import 'menuPage.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String? faixaEtaria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // 🔹 Botão de voltar (agora à direita)
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ),

              // 🔹 Título "Criar conta"
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 50), // distância de 100px até a faixa azul

              // 🔹 Container principal com faixa azul e altura ajustada
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Stack(
                  children: [
                    // Faixa azul indo até 100px após o botão
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            
                          ),
                          child: Container(color: const Color(0xFF3162CA)),
                        ),
                      ),
                    ),

                    // 🔹 Conteúdo do formulário
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextField('Usuário'),
                          const SizedBox(height: 20),
                          _buildTextField('E-mail'),
                          const SizedBox(height: 20),
                          _buildTextField('Telefone'),
                          const SizedBox(height: 20),
                          _buildTextField('Senha', obscureText: true),
                          const SizedBox(height: 20),
                          _buildTextField('Repetir senha', obscureText: true),
                          const SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              fillColor: const Color(0xFFE6F0FA),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            value: faixaEtaria,
                            items: ['18-25', '26-35', '36-45', '46+']
                                .map(
                                  (e) => DropdownMenuItem(
                                      value: e, child: Text(e)),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                faixaEtaria = value;
                              });
                            },
                            hint: const Text('Faixa etária'),
                          ),
                          const SizedBox(height: 40),

                          // 🔹 Botão "Cadastrar"
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
                                  backgroundColor: const Color(0xFFFF6EC7),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 21), // 🔹 espaço final de 100px
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: const Color(0xFFE6F0FA),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}