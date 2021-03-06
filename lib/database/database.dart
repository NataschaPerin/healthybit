//Imports that are necessary to the code generator of floor
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:healthybit/database/typeConverters/dateTimeConverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Here, we are importing the entities and the daos of the database
import 'package:healthybit/database/daos/foodDao.dart';
import 'package:healthybit/database/entities/food.dart';

//The generated code will be in database.g.dart
part 'database.g.dart';

//Here we are saying that this is the first version of the Database and it has just 1 entity, i.e., Meal.
//We also added a TypeConverter to manage the DateTime of a Meal entry, since DateTimes are not natively
//supported by Floor.
@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Food, Parameter])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  FoodDao get foodDao;
  ParameterDao get parameterDao;
}//AppDatabase