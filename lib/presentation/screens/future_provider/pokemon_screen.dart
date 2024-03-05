import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final pokemonId = ref.watch(pokemonIdProvider);
    // * Method to make a request every time the value changes
    final pokemonAsync = ref.watch(pokemonNameProvider);
    // * Method to preserve data and not forward request
    // final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon: $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (value) => Text(value), 
          error: (error, stackTrace) => Text('Error: $error'), 
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'plus',
            child: const Icon(Icons.plus_one_rounded),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'minus',
            child: const Icon(Icons.exposure_minus_1_rounded),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state - 1);
            },
          ),
        ],
      ),
    );
  }
}