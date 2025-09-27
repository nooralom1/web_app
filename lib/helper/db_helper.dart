import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> initDb() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), 'auth.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            password TEXT
            name TEXT
          )
        ''');
      },
    );
    return _db!;
  }

  static Future<int> signup(String email, String password, String name) async {
    final db = await initDb();
    return await db.insert('users', {
      'email': email,
      'password': password,
      "name": name,
    });
  }

  static Future<Map<String, dynamic>?> login(
    String email,
    String password,
  ) async {
    final db = await initDb();
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty ? result.first : null;
  }
}
