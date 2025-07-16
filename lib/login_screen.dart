import 'package:flutter/material.dart';
import 'Dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers dos campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  // Exibe ou esconde a senha
  bool _mostrarSenha = false;

  // Função chamada ao clicar em "Entrar"
  void _fazerLogin() {
    String email = emailController.text.trim();
    String senha = senhaController.text;

    if (email.isNotEmpty && senha.isNotEmpty) {
      // Aqui você pode validar o login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo com cor personalizada (mude aqui)
      backgroundColor: Colors.grey[100],

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24), // Espaçamento interno
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🖼️ Logo ou imagem do app
              Image.asset(
                'assets/images/logo.png',
                height: 80,// ajuste o tamanho conforme sua imagem
                fit: BoxFit.contain, // evita distorção

              ),
              SizedBox(height: 74),

              // 📝 Campo de e-mail
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(), // Borda do campo
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 24),

              // 🔐 Campo de senha
              TextField(
                controller: senhaController,
                obscureText: !_mostrarSenha, // Esconde texto
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(_mostrarSenha
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _mostrarSenha = !_mostrarSenha;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),

              // 🔘 Botão de Login
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _fazerLogin,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Borda arredondada
                    ), // Cor do botão
                    backgroundColor: Color(0xFF272525),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
                  ),
                ),
              ),

              SizedBox(height: 12),


              // --- Texto de esqueci a senha (apenas visual por enquanto).
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // Cor do texto
                    padding: EdgeInsets.all(16),
                ),
                onPressed: () {
                  // Ação ao clicar no link
                },
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.underline, // Sublinhado
                  ),
                ),
              ),


              // --- Texto de criar conta (apenas visual por enquanto).
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // Cor do texto
                  padding: EdgeInsets.all(16),
                ),
                onPressed: () {
                  // Ação ao clicar no link
                },
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.underline, // Sublinhado
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
