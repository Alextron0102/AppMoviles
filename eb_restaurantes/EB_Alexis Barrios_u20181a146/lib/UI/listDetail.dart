import 'package:eb_restaurantes/UI/listComment.dart';
import 'package:eb_restaurantes/model/restaurant.dart';
import 'package:eb_restaurantes/utils/db_helper.dart';
import 'package:eb_restaurantes/utils/http_helper.dart';
import 'package:flutter/material.dart';

class ListRestaurantsw extends StatefulWidget {
  final ListRestaurants restaurants;
  ListRestaurantsw({Key key, this.restaurants}) : super(key: key);
  @override
  _ListRestaurantswState createState() => _ListRestaurantswState();
}

class _ListRestaurantswState extends State<ListRestaurantsw> {
  DbHelper helper;
  @override
  void initState() {
    helper = DbHelper();
    super.initState();
  }

  Widget buildRestaurants() {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int i) {
          if (i < widget.restaurants.length() * 2) {
            if (i.isOdd) return Divider();
            final int index = i ~/ 2;
            return buildrow(widget.restaurants.getRestaurant(index));
          } else {
            return null;
          }
        });
  }

  Widget buildrow(Restaurant restaurant) {
    return ListTile(
        title: Text(restaurant.name),
        subtitle: Text(restaurant.location.city),
        trailing: IconButton(
            icon: Icon(Icons.comment),
            onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ListComments(idRestaurant: restaurant.id)));
                  
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de coincidencias'),
        ),
        body: buildRestaurants());
  }
}
