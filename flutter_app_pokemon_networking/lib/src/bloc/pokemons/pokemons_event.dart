import 'package:equatable/equatable.dart';
//PokemonsEvent hereda de Equatable
abstract class PokemonsEvent extends Equatable{
  const PokemonsEvent();
  @override
  List<Object> get props => [];
}
class AddMorePokemons extends PokemonsEvent{
  
}