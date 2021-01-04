import 'package:flutter/material.dart';
import 'package:eb_restaurantes/model/comment.dart';
import 'package:eb_restaurantes/utils/db_helper.dart';
class DetailComment extends StatefulWidget {
  Comment comment;
  String idRestaurant;
  DetailComment({Key key, this.comment , this.idRestaurant}) : super(key: key);
  @override
  _DetailCommentState createState() => _DetailCommentState();
}
class _DetailCommentState extends State<DetailComment> {
  final contentController = TextEditingController();
  DbHelper helper;
  @override
  void initState() {
    helper = DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title: Text('Ingreso de comentario'),
          centerTitle: true,
          backgroundColor: Colors.grey[900]),
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Text(
                'Dato: ',
              )),
          Container(
            padding: EdgeInsets.all(30.0),
            child: TextField(
              controller: contentController,
              autocorrect: false,
              maxLines: 3,
              maxLength: 50,
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.grey[600],
                  filled: true,
                  contentPadding:
                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                  ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {         
          //Guardamos el comentario en la base de datos:
          helper.insertComment(Comment(0,widget.idRestaurant,contentController.text));
          Navigator.pop(context, null);          
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}