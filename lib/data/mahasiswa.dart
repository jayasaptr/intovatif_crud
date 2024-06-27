import 'package:sqflite/sqflite.dart';

class DatabaseMahasiswa {
  static Database? _database;
  static final DatabaseMahasiswa db = DatabaseMahasiswa._();

  DatabaseMahasiswa._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    return await openDatabase(
      'mahasiswa.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE mahasiswa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            nim TEXT,
            jurusan TEXT,
            alamat TEXT
          )
        ''');
      },
    );
  }

  Future closeDb() async {
    final db = await database;
    db.close();
  }

  Future<int> insert(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('mahasiswa', data);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await database;
    return await db.query('mahasiswa');
  }

  Future<int> update(Map<String, dynamic> data) async {
    final db = await database;
    return await db.update(
      'mahasiswa',
      data,
      where: 'id = ?',
      whereArgs: [data['id']],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      'mahasiswa',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
