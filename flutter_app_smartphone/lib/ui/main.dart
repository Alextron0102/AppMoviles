import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_smartphone/data/moor_database.dart';

void main() {
  runApp(Orders());
}

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Order Smartphone'),
            ),
            body: SingleChildScrollView(child: NewOrder())));
  }
}

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: 'Ingrese modelo'),
          keyboardType: TextInputType.text,
          controller: productNameController,
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Ingrese precio'),
          keyboardType: TextInputType.text,
          controller: priceController,
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              AppDatabase().insertNewOrder(Order(
                  price: priceController.text,
                  productName: productNameController.text));
            });
            priceController.clear();
            productNameController.clear();
          },
          color: Colors.amberAccent,
          child: Text('Add to cart...'),
        ),
        Container(
          height: 700,
          width: double.infinity,
          child: StreamBuilder(
            stream: AppDatabase().watchAllOrder(),
            builder: (context, AsyncSnapshot<List<Order>> snapshot){
              return ListView.builder(
                  itemBuilder: (_, index){
                    return Card(
                      color: Colors.black12,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index+1}'),
                          radius: 20,
                          backgroundColor: Colors.black45,
                        ),
                        title: Text(snapshot.data[index].productName),
                        subtitle: Text('S/. ${snapshot.data[index].price}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (){
                            setState(() {
                              AppDatabase().deleteOrder(snapshot.data[index]);
                            });
                          },
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                itemCount: snapshot.data.length,
              );
            },
          ),
        )
      ],
    );
  }
}
