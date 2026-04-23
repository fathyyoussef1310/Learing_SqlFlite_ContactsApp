import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Core/TableColumns.dart';
import '../Models/UserModel.dart';
class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;
  Future<Database> get database async
  {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }
  Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''               
          CREATE TABLE $UsersColumn (      
            $IdColumn    INTEGER PRIMARY KEY  AUTOINCREMENT,
            $NameColumn  TEXT NOT NULL,
            $EmailColumn TEXT NOT NULL,
            $PhoneColumn TEXT NOT NULL,
            $ImageColumn TEXT 
          )
        ''');
      },
    );
  }

  Future<int> addUser(UserModel user) async {
    final dbUsers = await database;
    final User = await dbUsers.insert(UsersColumn, user.toJson(), conflictAlgorithm: ConflictAlgorithm.replace,);
    return User;
  }

  Future<int> Update(UserModel user) async
  {
    final DbUsers = await database;
    final User = await DbUsers.update(
        UsersColumn, user.toJson(), where: '$IdColumn=?', whereArgs: [user.id]);
    return User;
  }
  Future<int> DeleteUser(UserModel user) async {
    final DbClient = await database;
    return await DbClient.delete(UsersColumn, where: '$IdColumn = ? ',
        whereArgs: [user.id]);
  }
  Future<List<UserModel>> getAllUsers() async {
    final DbClient= await database;
    final List<Map<String, dynamic>> maps = await DbClient.query(UsersColumn);
    return maps.map((e)=> UserModel.fromJson(e)).toList();
  }
}