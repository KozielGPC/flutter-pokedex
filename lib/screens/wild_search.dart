import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class WildSearchScreen extends StatefulWidget {
  const WildSearchScreen({super.key});

  static const routeName = 'wild_search';

  @override
  State<WildSearchScreen> createState() => _WildSearchScreenState();
}

class _WildSearchScreenState extends State<WildSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PokemonProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 90,

                  ), 
                itemBuilder: (context, index){
                  return PokemonCard(pokemon: provider.pokemons[index]);
                },
                itemCount: provider.pokemons.length,
                
                )
            )
          ],
        ),
      ),
    );
  }
}
