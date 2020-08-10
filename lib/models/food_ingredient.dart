part of 'models.dart';

class FoodIngredient extends Equatable {
  final int id;
  final int foodID;
  final String name;

  FoodIngredient({
    this.id,
    this.foodID,
    this.name,
  });

  factory FoodIngredient.fromJson(Map<String, dynamic> json) => FoodIngredient(
    id: json['id'],
    foodID: json['food_id'],
    name: json['name'],
  );

  @override
  List<Object> get props => [id, foodID, name];
}
