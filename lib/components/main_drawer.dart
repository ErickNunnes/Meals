import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,    
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 241, 195, 54),
            alignment: Alignment.bottomRight,
            child: const Text(
              'Vamos cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Color.fromARGB(255, 228, 94, 138)
              ),
            ),
        ),
        const SizedBox(height: 20,),
        _createItem(
          Icons.restaurant,
          'Refeições',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
        _createItem(
          Icons.settings,
          'Configurações',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS))
      ]),
    );
  }
}