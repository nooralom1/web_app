// ignore_for_file: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  static Future<Database> initDb() async {
    if (_db != null) return _db!;

    String path = join(await getDatabasesPath(), 'auth.db');

    _db = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,  -- id manually manage হবে
            email TEXT UNIQUE,
            password TEXT,
            name TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE users ADD COLUMN name TEXT');
        }
      },
    );

    return _db!;
  }

  static Future<int> signup(String email, String password, String name) async {
    final db = await initDb();

    final lastIdResult = await db.rawQuery('SELECT MAX(id) FROM users');
    int nextId = (Sqflite.firstIntValue(lastIdResult) ?? -1) + 1;

    return await db.insert('users', {
      'id': nextId,
      'email': email,
      'password': password,
      'name': name,
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
