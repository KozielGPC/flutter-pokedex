import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/models/captured_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon.dart';
import 'package:pokedex/screens/wild_search.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokemonProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pokemons'),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, WildSearchScreen.routeName);
            },
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.cyan, width: 3)),
            icon: const Icon(
              Icons.search,
              color: Colors.cyan,
            ),
            label: const Text(
              'Pokemons\nSelvagens',
              style: TextStyle(color: Colors.grey, fontSize: 8),
              textAlign: TextAlign.center,
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            TextField(
              style:
                  Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 10),
              decoration:
                  const InputDecoration(hintText: 'Pesquisar seus pokemons'),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                final capturedPokemon = provider.capturedPokemons[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: PokemonCard(
                      pokemon:
                          provider.getPokemonById(capturedPokemon.pokemonId)!,
                      capturedPokemon: capturedPokemon),
                );
              },
              itemCount: provider.capturedPokemons.length,
            ))
          ]),
        ));
  }
}
