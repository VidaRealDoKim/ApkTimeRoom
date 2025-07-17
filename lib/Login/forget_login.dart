import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetLoginState();
}

class _ForgetLoginState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  void _sendRecoveryEmail() {
    final email = emailController.text;

    // Aqui você pode colocar a lógica para enviar o e-mail de recuperação
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('E-mail de recuperação enviado para $email')),
    );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Recuperar Senha'),
        centerTitle: true,
      ),


      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Informe o e-mail cadastrado abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 32),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),

            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _sendRecoveryEmail,
              style:

              ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),

              child:
              const Text('Enviar',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffffffff),
                ),

              ),

            ),

            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cancela ação
              },
              child:
              const Text('Cancelar',
                style: TextStyle(
                fontSize: 16,
                color: Color(0xff000000),
                ),
              ),

            ),
          ],
        ),

      ),

    );

  }

}
