import 'package:healthybit/database/database.dart';
import 'package:healthybit/database/entities/food.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllMeals() method of the DAO
  Future<List<Food>> findAllFoods() async {
    final results = await database.foodDao.findAllFoods();
    return results;
  } //findAllFoods

  //This method wraps the insertMeal() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertFood(Food food) async {
    await database.foodDao.insertFood(food);
    notifyListeners();
  } //insertFood

  //This method wraps the deleteMeal() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeFood(Food food) async {
    await database.foodDao.deleteFood(food);
    notifyListeners();
  } //removeFood

  //This method wraps the updateMeal() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> updateFood(Food food) async {
    await database.foodDao.updateFood(food);
    notifyListeners();
  } //updateMeal

} //DatabaseRepository

