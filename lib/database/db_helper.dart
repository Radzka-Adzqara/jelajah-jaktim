import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // ================= INSTANCE =================
  static final DBHelper instance =
      DBHelper._init();

  DBHelper._init();

  static Database? _database;

  // ================= DATABASE =================
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database =
        await _initDB(
      'jelajahjaktim.db',
    );

    return _database!;
  }

  // ================= INIT DATABASE =================
  Future<Database> _initDB(
    String filePath,
  ) async {
    final dbPath =
        await getDatabasesPath();

    final path =
        join(dbPath, filePath);

    // PRINT LOKASI DATABASE
    log(
      "Lokasi Database: $path",
    );

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
    );
  }

  // ================= CREATE TABLE =================
  Future<void> _createDB(
    Database db,
    int version,
  ) async {
    await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL
    )
    ''');

    // USER DEFAULT
    await db.insert(
      'users',
      {
        'nama': 'Radzka',
        'email': 'admin@gmail.com',
        'password': '12345',
      },
    );
  }

  // ================= REGISTER USER =================
  Future<int> registerUser(
    String nama,
    String email,
    String password,
  ) async {
    final db =
        await instance.database;

    return await db.insert(
      'users',
      {
        'nama': nama,
        'email': email,
        'password': password,
      },
      conflictAlgorithm:
          ConflictAlgorithm.replace,
    );
  }

  // ================= LOGIN USER =================
  Future<Map<String, dynamic>?>
      loginUser(
    String email,
    String password,
  ) async {
    final db =
        await instance.database;

    final result =
        await db.query(
      'users',
      where:
          'email = ? AND password = ?',
      whereArgs: [
        email,
        password,
      ],
    );

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }

  // ================= AMBIL SEMUA USER =================
  Future<List<Map<String, dynamic>>>
      getAllUsers() async {
    final db =
        await instance.database;

    return await db.query(
      'users',
    );
  }

  // ================= DELETE USER =================
  Future<int> deleteUser(
      int id) async {
    final db =
        await instance.database;

    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ================= HAPUS DATABASE =================
  Future<void>
      deleteDatabaseFile() async {
    final dbPath =
        await getDatabasesPath();

    final path = join(
      dbPath,
      'jelajahjaktim.db',
    );

    await deleteDatabase(
      path,
    );

    print(
      "Database berhasil dihapus",
    );
  }
}