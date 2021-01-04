class Comment {
  int id;
  String idRestaurant;
  String content;
  Comment(this.id, this.idRestaurant, this.content);
  Map<String, dynamic> toMap(){
    return {
      'id': (id==0)?null:id,
      'idRestaurant': idRestaurant,
      'context': content
    };
  }
}