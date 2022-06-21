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

  //This method wraps the updateFood() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> updateFood(Food food) async {
    await database.foodDao.updateFood(food);
    notifyListeners();
  } //updateFood

  //This method wraps the findAllParameters() method of the DAO
  Future<List<Food>> findAllParameters() async {
    final results = await database.parameterDao.findAllParameters();
    return results;
  } //findAllParameters

  //This method wraps the insertParameter() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertParameter(Parameter parameter) async {
    await database.parameterDao.insertParameter(parameter);
    notifyListeners();
  } //insertParameter

  //This method wraps the updateParameter() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> updateParameter(Parameter parameter) async {
    await database.parameterDao.updateParameter(parameter);
    notifyListeners();
  } //updateParameter

} //DatabaseRepository

