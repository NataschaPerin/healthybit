// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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

  FoodDao? _foodDaoInstance;

  ParameterDao? _parameterDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `Food` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `weight` REAL NOT NULL, `carbohydrates` REAL NOT NULL, `proteins` REAL NOT NULL, `lipids` REAL NOT NULL, `calories` REAL NOT NULL, `dateTime` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Parameter` (`personalId` INTEGER PRIMARY KEY AUTOINCREMENT, `personWeight` INTEGER NOT NULL, `Height` INTEGER NOT NULL, `BMI` REAL NOT NULL, `date` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FoodDao get foodDao {
    return _foodDaoInstance ??= _$FoodDao(database, changeListener);
  }

  @override
  ParameterDao get parameterDao {
    return _parameterDaoInstance ??= _$ParameterDao(database, changeListener);
  }
}

class _$FoodDao extends FoodDao {
  _$FoodDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _foodInsertionAdapter = InsertionAdapter(
            database,
            'Food',
            (Food item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'weight': item.weight,
                  'carbohydrates': item.carbohydrates,
                  'proteins': item.proteins,
                  'lipids': item.lipids,
                  'calories': item.calories,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _foodUpdateAdapter = UpdateAdapter(
            database,
            'Food',
            ['id'],
            (Food item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'weight': item.weight,
                  'carbohydrates': item.carbohydrates,
                  'proteins': item.proteins,
                  'lipids': item.lipids,
                  'calories': item.calories,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _foodDeletionAdapter = DeletionAdapter(
            database,
            'Food',
            ['id'],
            (Food item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'weight': item.weight,
                  'carbohydrates': item.carbohydrates,
                  'proteins': item.proteins,
                  'lipids': item.lipids,
                  'calories': item.calories,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Food> _foodInsertionAdapter;

  final UpdateAdapter<Food> _foodUpdateAdapter;

  final DeletionAdapter<Food> _foodDeletionAdapter;

  @override
  Future<List<Food>> findAllFoods() async {
    return _queryAdapter.queryList('SELECT * FROM Food',
        mapper: (Map<String, Object?> row) => Food(
            row['id'] as int?,
            row['name'] as String,
            row['weight'] as double,
            row['carbohydrates'] as double,
            row['proteins'] as double,
            row['lipids'] as double,
            row['calories'] as double,
            _dateTimeConverter.decode(row['dateTime'] as int)));
  }

  @override
  Future<void> insertFood(Food food) async {
    await _foodInsertionAdapter.insert(food, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateFood(Food food) async {
    await _foodUpdateAdapter.update(food, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteFood(Food food) async {
    await _foodDeletionAdapter.delete(food);
  }
}

class _$ParameterDao extends ParameterDao {
  _$ParameterDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _parameterInsertionAdapter = InsertionAdapter(
            database,
            'Parameter',
            (Parameter item) => <String, Object?>{
                  'personalId': item.personalId,
                  'personWeight': item.personWeight,
                  'Height': item.Height,
                  'BMI': item.BMI,
                  'date': _dateTimeConverter.encode(item.date)
                }),
        _parameterUpdateAdapter = UpdateAdapter(
            database,
            'Parameter',
            ['personalId'],
            (Parameter item) => <String, Object?>{
                  'personalId': item.personalId,
                  'personWeight': item.personWeight,
                  'Height': item.Height,
                  'BMI': item.BMI,
                  'date': _dateTimeConverter.encode(item.date)
                }),
        _parameterDeletionAdapter = DeletionAdapter(
            database,
            'Parameter',
            ['personalId'],
            (Parameter item) => <String, Object?>{
                  'personalId': item.personalId,
                  'personWeight': item.personWeight,
                  'Height': item.Height,
                  'BMI': item.BMI,
                  'date': _dateTimeConverter.encode(item.date)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Parameter> _parameterInsertionAdapter;

  final UpdateAdapter<Parameter> _parameterUpdateAdapter;

  final DeletionAdapter<Parameter> _parameterDeletionAdapter;

  @override
  Future<List<Parameter>> findAllParameters() async {
    return _queryAdapter.queryList('SELECT * FROM Parameter',
        mapper: (Map<String, Object?> row) => Parameter(
            row['personalId'] as int?,
            row['personWeight'] as int,
            row['Height'] as int,
            row['BMI'] as double,
            _dateTimeConverter.decode(row['date'] as int)));
  }

  @override
  Future<void> insertParameter(Parameter parameter) async {
    await _parameterInsertionAdapter.insert(
        parameter, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateParameter(Parameter parameter) async {
    await _parameterUpdateAdapter.update(parameter, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteParameter(Parameter parameter) async {
    await _parameterDeletionAdapter.delete(parameter);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
