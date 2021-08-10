import 'package:path/path.dart';
import 'package:providder/dao/book_dao.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  final tables = [BookDAO.CREATE_TABLE];
  //Secondary constructor
  DBHelper._privateConstructor();
  //Create INSTANCE
  static DBHelper INSTANCE = DBHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async{
    if(_database != null){
      return _database;
    }else{
      _database = await openDB();
      return _database;
    }
  }

  Future<Database?> openDB()async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'to_do.db');

    return await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async{
        tables.forEach((table)async {
          await db.execute(table);
         });
      }
    );
  }

  Future<int?> insert(String tableName, Map<String, dynamic> data) async{
    final Database? db = await INSTANCE.database;
    return db?.insert(tableName, data);
  }

  Future<dynamic> select(String tableName, String field, List<dynamic> data) async{
    final Database? db = await INSTANCE.database;
    return db?.query(tableName, where: field, whereArgs: data);
  }
}