part of 'models.dart';

class Order extends Equatable {
  final int id;
  final int userID;
  final int foodID;
  final int quantity;
  final String status;
  final Food food;

  Order({
    this.id,
    this.userID,
    this.foodID,
    this.quantity,
    this.status,
    this.food,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    userID: json['user_id'],
    foodID: json['food_id'],
    quantity: json['quantity'],
    status: json['status'],
    food: Food.fromJson(json['food']),
  );

  @override
  List<Object> get props => [
    id,
    userID,
    foodID,
    quantity,
    status,
    food,
  ];
}
