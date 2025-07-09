import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importa a tela de login para redirecionar após logout
import 'home_page.dart';
import 'reservas_page.dart';
import 'salas_page.dart';
import 'perfil_page.dart';


class DashboardScreen extends StatefulWidget {

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),       // <- Aqui terá o botão e a lista de salas
    ReservasPage(),   // <- Você pode personalizar essa também
    SalasPage(),      // <- Pode mostrar as salas do usuário
    PerfilPage(),     // <- Dados do perfil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2CC0AF), // muda o topo
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Sair',
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xFF2CC0AF),
        selectedItemColor: Color(0xFF007D6E),
        unselectedItemColor: Color(0xFF2CC0AF),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Reservas',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.web_outlined),
            label: 'Salas',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),

        ],
      ),
    );
  }
}

