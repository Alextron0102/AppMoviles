import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app_pokemon_networking/src/remote/models/pokemons_response.dart';
abstract class PokemonsState extends Equatable {
  const PokemonsState();
}
//aun no se ha cargado
class WithoutPokemonsState extends PokemonsState {
  final List<Results> pokemons = [];

  @override
  List<Object> get props => [pokemons];
}
//estado cargado
class WithPokemonsState extends PokemonsState {
  final List<Results> pokemons;
  final int amount;

  WithPokemonsState({@required this.pokemons, @required this.amount});

  @override
  List<Object> get props => [this.pokemons, this.amount];
}