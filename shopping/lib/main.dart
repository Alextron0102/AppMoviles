import 'package:flutter/material.dart';
import 'package:shopping/ui/shopping_list_dialog.dart';
import 'package:shopping/util/dbhelper.dart';
import 'package:shopping/models/shopping_list.dart';
import 'package:shopping/models/list_items.dart';
import 'package:shopping/ui/items_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DbHelper helper = DbHelper();
    // helper.testDB();
    return MaterialApp(
      title: 'Lista de compras',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ShowList(),
    );
  }
}

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  DbHelper _helper = DbHelper();
  List<ShoppingList> shoppingList;
  Future showData() async {
    await _helper.openDb();
    shoppingList = await _helper.getLists();
    setState(() {
      shoppingList = shoppingList;
    });
  }

  ShoppingListDialog dialog;
  @override
  void initState() {
    dialog = ShoppingListDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping list'),
        ),
        body: ListView.builder(
          itemCount: (shoppingList != null) ? shoppingList.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(shoppingList[index].name),
              onDismissed: (direction){
                String strName = shoppingList[index].name;
                _helper.deleteList(shoppingList[index]);
                setState((){
                  shoppingList.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("$strName deleted")));
              },    
            child: ListTile(
              title: Text(
                shoppingList[index].name,
              ),
              leading: CircleAvatar(
                child: Text(shoppingList[index].priority.toString()),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ItemsScreen(shoppingList[index])));
              },
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog.buildDialog(
                          context, shoppingList[index], false));
                },
              ),
            ));
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          showDialog(context: context, builder: (BuildContext context)=>dialog.buildDialog(context, ShoppingList(0,'',0), true),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,));
  }
}
