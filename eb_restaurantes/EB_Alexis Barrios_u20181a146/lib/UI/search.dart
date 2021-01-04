import 'package:eb_restaurantes/UI/listDetail.dart';
import 'package:eb_restaurantes/utils/http_helper.dart';
import 'package:flutter/material.dart';

class SearchRestaurant extends StatelessWidget {
  final nombreController = TextEditingController();
  HttpHelper helper;
  @override
  Widget build(BuildContext context) {
    helper = HttpHelper();
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu Principal"),
        ),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("Busqueda de restaurante")),
            Padding( padding: const EdgeInsets.all(24.0),
              child:       TextField(
              //FocusScope.of(context).requestFocus(new FocusNode()),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              cursorColor: Colors.black,
              autocorrect: false,
              controller: nombreController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                contentPadding:
                    EdgeInsets.only(bottom: 2.0, left: 2.0, right: 2.0),
                hintText: 'Nombre',
                hintStyle: TextStyle(color: Colors.black),
              ),
            )),
            ElevatedButton(
              child: Text('Buscar'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 45)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                helper.getRestaurant(nombreController.text).then((value){
                    // value.printx();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListRestaurantsw(restaurants: value
                             )));
                });
              },
            ),
          ]),
        ));
  }
}
