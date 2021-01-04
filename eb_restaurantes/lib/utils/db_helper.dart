import 'package:eb_restaurantes/model/comment.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final int version = 1;
  Database db;
  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper(){
    return _dbHelper;
  }
  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'shopping.db'),
          onCreate: (database, version) {
        database.execute('CREATE TABLE comments ('
                'id INTEGER PRIMARY KEY, '
                'idRestaurant TEXT,'
                'content TEXT,'
        );
      }, version: version);
    }
    return db;
  }

  Future testDB() async {
    db = await openDb();
    await db.execute(
        'INSERT INTO comments VALUES (0,"0","Buenos platos")'
      );
    List comments = await db.rawQuery('select * from comments');
    print(comments[0].toString());
  }
  Future<int> insertComment(Comment comment) async{
    int id = await this.db.insert('comments', comment.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
  Future<int> deleteComment(Comment comment) async{
    int result = await this.db.delete('comments', where: 'id = ?', whereArgs: [comment.id]);
    return result;
  }
  Future<List<Comment>> getComments(String idRestaurant) async{
    final List<Map<String,dynamic>> maps = await db.query('comments', where: 'idRestaurant = ?', whereArgs: [idRestaurant]);
    return List.generate(maps.length, (index){
      return Comment(
        maps[index]['id'],
        maps[index]['idRestaurant'],
        maps[index]['content']
      );
    });
  }
}
