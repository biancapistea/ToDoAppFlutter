// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ToDoDao? _todoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `todo` (`id` INTEGER, `category` INTEGER, `title` TEXT, `description` TEXT, `date` TEXT, `publishedAt` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ToDoDao get todoDao {
    return _todoDaoInstance ??= _$ToDoDao(database, changeListener);
  }
}

class _$ToDoDao extends ToDoDao {
  _$ToDoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _toDoModelInsertionAdapter = InsertionAdapter(
            database,
            'todo',
            (ToDoModel item) => <String, Object?>{
                  'id': item.id,
                  'category': item.category?.index,
                  'title': item.title,
                  'description': item.description,
                  'date': item.date,
                  'publishedAt': item.publishedAt
                }),
        _toDoModelUpdateAdapter = UpdateAdapter(
            database,
            'todo',
            ['id'],
            (ToDoModel item) => <String, Object?>{
                  'id': item.id,
                  'category': item.category?.index,
                  'title': item.title,
                  'description': item.description,
                  'date': item.date,
                  'publishedAt': item.publishedAt
                }),
        _toDoModelDeletionAdapter = DeletionAdapter(
            database,
            'todo',
            ['id'],
            (ToDoModel item) => <String, Object?>{
                  'id': item.id,
                  'category': item.category?.index,
                  'title': item.title,
                  'description': item.description,
                  'date': item.date,
                  'publishedAt': item.publishedAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ToDoModel> _toDoModelInsertionAdapter;

  final UpdateAdapter<ToDoModel> _toDoModelUpdateAdapter;

  final DeletionAdapter<ToDoModel> _toDoModelDeletionAdapter;

  @override
  Future<List<ToDoModel>> getTodos() async {
    return _queryAdapter.queryList('SELECT * FROM todo',
        mapper: (Map<String, Object?> row) => ToDoModel(
            id: row['id'] as int?,
            category: row['category'] == null
                ? null
                : Category.values[row['category'] as int],
            title: row['title'] as String?,
            description: row['description'] as String?,
            date: row['date'] as String?,
            publishedAt: row['publishedAt'] as String?));
  }

  @override
  Future<List<ToDoModel>> getTodosFilteredByCategory(String category) async {
    return _queryAdapter.queryList('SELECT * FROM todo WHERE category = ?1',
        mapper: (Map<String, Object?> row) => ToDoModel(
            id: row['id'] as int?,
            category: row['category'] == null
                ? null
                : Category.values[row['category'] as int],
            title: row['title'] as String?,
            description: row['description'] as String?,
            date: row['date'] as String?,
            publishedAt: row['publishedAt'] as String?),
        arguments: [category]);
  }

  @override
  Future<void> insertTodo(ToDoModel todo) async {
    await _toDoModelInsertionAdapter.insert(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> editTodo(ToDoModel todo) async {
    await _toDoModelUpdateAdapter.update(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteArticle(ToDoModel todo) async {
    await _toDoModelDeletionAdapter.delete(todo);
  }
}
