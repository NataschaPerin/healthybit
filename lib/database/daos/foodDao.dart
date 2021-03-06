import 'package:healthybit/database/entities/food.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class FoodDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Food table
  @Query('SELECT * FROM Food')
  Future<List<Food>> findAllFoods();

  //Query #2: INSERT -> this allows to add a Food in the table
  @insert
  Future<void> insertFood(Food food);

  //Query #3: DELETE -> this allows to delete a Food from the table
  @delete
  Future<void> deleteFood(Food food);

  //Query #4: UPDATE -> this allows to update a Food entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateFood(Food food);
} //FoodDao

@dao
abstract class ParameterDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Food table
  @Query('SELECT * FROM Parameter')
  Future<List<Parameter>> findAllParameters();

  //Query #2: INSERT -> this allows to add a Parameter in the table
  @insert
  Future<void> insertParameter(Parameter parameter);

  //Query #3: UPDATE -> this allows to update a Parameter entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateParameter(Parameter parameter);

  //Query #3: DELETE -> this allows to delete a Food from the table
  @delete
  Future<void> deleteParameter(Parameter parameter);
}//ParameterDao