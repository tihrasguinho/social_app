import 'package:flutter/material.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Favorites')),
    );
  }
}
