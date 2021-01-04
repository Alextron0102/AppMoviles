import 'package:eb_restaurantes/UI/detailComment.dart';
import 'package:eb_restaurantes/model/comment.dart';
import 'package:eb_restaurantes/utils/db_helper.dart';
import 'package:flutter/material.dart';

class ListComments extends StatefulWidget {
  final String idRestaurant;
  ListComments({Key key, this.idRestaurant}) : super(key: key);
  @override
  _ListCommentsState createState() => _ListCommentsState();
}

class _ListCommentsState extends State<ListComments> {
  DbHelper helper;
  List<Comment> comments;
  @override
  void initState(){
    helper = DbHelper();
    loadComments();
    super.initState();
  }
  Future loadComments() async{
    await helper.openDb();
    comments = await helper.getComments(widget.idRestaurant);
  }
  Widget buildComments() {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int i) {
          if (i < comments.length * 2) {
            if (i.isOdd) return Divider();
            final int index = i ~/ 2;
            return buildrow(comments.elementAt(index));
          } else {
            return null;
          }
        });
  }

  Widget buildrow(Comment comment) {
    return ListTile(
        title: Text(comment.content),
        trailing: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                //Aqui se tiene que editar el comentario
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailComment(comment: comment, idRestaurant: widget.idRestaurant)));
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                //Aqui se tiene que eliminar el comentario
                helper.deleteComment(comment).then((value) => setState((){
                    helper.getComments(widget.idRestaurant).then((value) {
                      comments = value;
                      setState((){});//Actualizamos la vista
                    });
                }));
              },
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de comentarios'),
        ),
        body: buildComments(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailComment(comment: null, idRestaurant: widget.idRestaurant)));
        },),);
  }
}
