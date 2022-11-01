import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/models/captured_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon.dart';
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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: PokemonCard(
                    pokemon: provider.getPokemonById(1)!,
                    capturedPokemon:
                        CapturedPokemon(hp: 1, id: 1, pokemonId: 1, xp: 1),
                  ),
                );
              },
              itemCount: 10,
            ))
          ]),
        ));
  }
}
