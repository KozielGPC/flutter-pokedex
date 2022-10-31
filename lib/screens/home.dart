import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pokemons'),
      ),
      body: Column(children: [
        TextField(
          style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 10),
          decoration:
              const InputDecoration(hintText: 'Pesquisar seus pokemons'),
        )
      ]),
    );
  }
}
