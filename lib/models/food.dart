part of 'models.dart';

class Food extends Equatable {
  final int id;
  final String name;
  final String score;
  final String description;
  final int price;
  final String picture;
  final List<FoodIngredient> ingredients;

  Food({
    @required this.id,
    @required this.name,
    @required this.score,
    @required this.description,
    @required this.price,
    @required this.picture,
    @required this.ingredients,
  });

  @override
  List<Object> get props => [
    id,
    name,
    score,
    description,
    price,
    picture,
    ingredients,
  ];

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      score: json['score'],
      description: json['description'],
      price: json['price'],
      picture: json['picture'],
      ingredients: List<FoodIngredient>.from(json['ingredients'].map((x) => FoodIngredient.fromJson(x))),
    );
  }
}
