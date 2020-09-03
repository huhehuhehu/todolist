import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'const.dart';



class quicky{
  String content;
  int id;
  String title;

  quicky({this.content, this.id});

  String getTitle(){
    return ls.convert(content)[0];
  }

  Map<String, dynamic> toMap(){
    return {
      Column_name : this.content
    };
  }
}

class TodoHelper{
  Database db;

  TodoHelper(){
    initDatabase();
  }

  Future<void> initDatabase() async{
    db = await openDatabase(
        join(await getDatabasesPath(), "de.db"),
        onCreate: (db, version){
          return db.execute("CREATE TABLE $tableName($Column_id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_name TEXT)");
        },
        version: 1
    );
  }

  Future<void> insertTask(quicky q) async{
    try{
      db.insert(tableName, q.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }catch(_){
      print(_);
    }
  }

  Future<List<quicky>> getAllTask () async{
    final List<Map<String, dynamic>> tasks = await db.query(tableName);

    return List.generate(tasks.length, (i){
      return quicky(content: tasks[i][Column_name], id: tasks[i][Column_id]);
    });
  }

  Future<void> deleteTask(int id) async{
    var dodo = await this.db;
    await dodo.rawDelete('DELETE FROM $tableName WHERE $Column_id = $id');

  }

  Future<void> editTask(int index, String s) async{
    var res = await db.update(tableName, quicky(content: s, id: index).toMap(),
        where: "id = ?", whereArgs: [ques[index].id]);
    return res;
  }


}