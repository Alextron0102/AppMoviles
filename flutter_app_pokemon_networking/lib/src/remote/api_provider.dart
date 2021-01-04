import 'package:flutter_app_pokemon_networking/src/remote/api_base_helper.dart';
import 'package:flutter_app_pokemon_networking/src/remote/models/pokemons_response.dart';
class ApiProvider {
  ApiBaseHelper helper = ApiBaseHelper();
  Future<List<Results>> fetchPokemons({int offset = 0}) async {
    final path = 'pokemon/?offset=$offset&limit=20';
    final responseString = await helper.get(path);
    final response = PokemonResponse.fromJson(responseString).results;
    return response;
  }
    Future<List<Results>> FindPokemonByName({String id}) async {
    final path = 'pokemon/$id';
    final responseString = await helper.get(path);
    final response = PokemonResponse.fromJson(responseString).results;
    return response;
  }
}