import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eb_restaurantes/model/restaurant.dart';

class HttpHelper {
  final String urlBase = 'https://developers.zomato.com/api/v2.1';
  final String urlSearch = '/search';

  Future<ListRestaurants> getRestaurant(String palabraclave) async{
    final String url = urlBase+urlSearch;
    http.Response result = await http.get(url,
    headers: <String, String>{
      'user-key':'71e6b9d615371d3a257047695a407cb0',
      'q':palabraclave
    });
    if(result.statusCode == HttpStatus.ok){
      //Parseamos los datos:
      final jsonResponse = json.decode(result.body);
      final listaRestaurantes = ListRestaurants.fromJson(jsonResponse);
      return listaRestaurantes;
    } else{
      print(result.body);
      return null;
    }
  }
}