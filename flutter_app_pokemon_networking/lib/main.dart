import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_pokemon_networking/simple_bloc_delegate.dart';
import 'package:flutter_app_pokemon_networking/app.dart';
import 'package:flutter_app_pokemon_networking/src/bloc/pokemons/pokemons_bloc.dart';
import 'package:flutter_app_pokemon_networking/src/repository/pokemon_repository.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  PokemonRepository pokemonRepository = PokemonRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PokemonsBloc>(
        create: (BuildContext context) =>
            PokemonsBloc(pokemonRepository: pokemonRepository),
      )
    ],
    child: MyApp(),
  ));
}