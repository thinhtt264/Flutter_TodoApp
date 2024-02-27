import 'package:flutter_application_1/data/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final table = 'Tasks';
  static final DatabaseService _databaseService = DatabaseService._internal();
  DatabaseService._internal();
  factory DatabaseService() => _databaseService;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<void> close() async {
    final db = await _databaseService.database;
    db.close();
  }

  Future<int> addTask(Task task) async {
    final db = await _databaseService.database;
    return await db.insert(table, task.toMap());
  }

  Future<int> deleteTask(Task task) async {
    final db = await _databaseService.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> updateTask(Task task) async {
    final db = await _databaseService.database;
    return await db
        .update(table, task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<List<Task>> getAllTasks() async {
    final db = await _databaseService.database;
    final List<Map<String, Object?>> taskMaps = await db.query(table);

    final data = [
      for (final {
            'id': id,
            'title': title,
            'description': description,
            'time': time,
            'date': date,
            'isCompleted': isCompleted,
          } in taskMaps)
        Task(
          id: id as int,
          title: title as String,
          description: description as String,
          time: time as String,
          date: date as String,
          isCompleted: isCompleted == 1 ? true : false,
        )
    ];
    return data;
  }

  Future<Database> _initDatabase() async {
    // Set the path to the database using the join function from the path package.
    String path = join(await getDatabasesPath(), 'todoApp_database.db');
    print('database path ' + path);

    // Check if the database exists.
    bool databaseExists = await databaseFactory.databaseExists(path);

    if (!databaseExists) {
      // If the database does not exist, create it.
      final db = await openDatabase(
        path,
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE $table (id	INTEGER NOT NULL UNIQUE, title TEXT, description	TEXT, isCompleted	INTEGER, date	TEXT, time TEXT, PRIMARY KEY(id))");
        },
        version: 1,
      );
      return db;
    } else {
      final db = await openDatabase(path);
      int version = await db.getVersion();
      print('Database version: $version');
      return db;
    }
  }
}
