import 'package:flutter/material.dart';

// Definição das cores
const Color primaryBlue = Color(0xFF3162CA);
const Color secondaryPink = Color(0xFFF06292); // Cor aproximada da imagem

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // Widget auxiliar para criar os botões principais
  Widget _buildMenuButton({
    required BuildContext context,
    required String imagePath,
    required String text,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 300, // Largura fixa para os botões, ajustável se necessário
        height: 60, // Altura para o botão
        child: ElevatedButton(
          onPressed:
              onPressed ??
              () {
                // Ação padrão, pode ser a navegação para a respectiva tela
                debugPrint('$text pressionado');
              },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3162CA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            // Alinha o conteúdo à esquerda
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize
                .min, // Ocupa apenas o espaço necessário pelo conteúdo
            children: [
              // 1. Image.asset no lugar do Icon
              Image.asset(
                imagePath,
                width: 50, // Tamanho da imagem
                height: 50,
              ),
              const SizedBox(width: 15), // Espaçamento entre a imagem e o texto
              // 2. Texto do botão
              Expanded(
                // <-- Adicionei isso para garantir que o texto não faça overflow
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  overflow: TextOverflow
                      .ellipsis, // Trunca o texto com "..." se necessário
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Fundo cinza claro da imagem
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo/Ícone e Título UniSOS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
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
                    const SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 40,
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
                  ],
                ),
                const SizedBox(height: 50),

                // Botões de Menu agora usam o caminho da imagem
                _buildMenuButton(
                  context: context,
                  imagePath:
                      'assets/images/pessoas.png', // <-- Caminho da sua imagem de Comunidade
                  text: 'Comunidade',
                  onPressed: () {},
                ),
                _buildMenuButton(
                  context: context,
                  imagePath:
                      'assets/images/livrinho.png', // <-- Caminho da sua imagem de E-Book
                  text: 'E-Book',
                  onPressed: () {},
                ),
                _buildMenuButton(
                  context: context,
                  imagePath:
                      'assets/images/pessoa.png', // <-- Caminho da sua imagem de Conversas
                  text: 'Conversas',
                  onPressed: () {},
                ),
                _buildMenuButton(
                  context: context,
                  imagePath:
                      'assets/images/config.png', // <-- Caminho da sua imagem de Configuração
                  text: 'Configuração',
                  onPressed: () {},
                ),

                // Botão SOS Circular (com texto)
                Image.asset(
                  'assets/images/sos.png',
                  width: 150, // Opcional: define a largura da imagem
                  height: 150, // Opcional: define a altura da imagem
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
