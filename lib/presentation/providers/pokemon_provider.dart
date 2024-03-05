import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

// * Method to make a request every time the value changes
final pokemonNameProvider = FutureProvider<String>((ref) async {
  final id = ref.watch(pokemonIdProvider);
  final name = await PokemonService.getPokemonName(id);
  return name;
});

// * Method to preserve data and not forward request
// final pokemonNameProvider = FutureProvider.family<String, int>((ref, id) async {
//   final name = await PokemonService.getPokemonName(id);
//   return name;
// });