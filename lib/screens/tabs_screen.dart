import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  List<Map<String, Object>>? _screens;

  @override
  void initState(){
    super.initState();
  _screens =[
    { 'title' : 'Lista de categoria', 'screen': const CategoriesScreen()},
    { 'title' : 'Meus Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals)},
  ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 94, 138),
        title: Text(_screens![_selectedScreenIndex] ['title'] as String, textAlign: TextAlign.center,
      ),
    ),
    drawer: const MainDrawer(),
      body: _screens![_selectedScreenIndex] ['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos'
              )
        ],
      ),
      );
  }
}