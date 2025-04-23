import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MoodDatabase {
  static final MoodDatabase instance = MoodDatabase._init();

  static Database? _database;

  MoodDatabase._init();

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mood.db');
    return _database!;
  }

  // Initialize database
  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath(); // Get default database path
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Create database table
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE mood (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        mood TEXT NOT NULL,
        description TEXT,
        timestamp TEXT NOT NULL
      )
    ''');
  }

  // Close the database
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
