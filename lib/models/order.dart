part of 'models.dart';

class Order extends Equatable {
  final int id;
  final int userID;
  final int foodID;
  final String uuid;
  final int quantity;
  final String status;
  final DateTime time;
  final Food food;

  Order({
    this.id,
    this.userID,
    this.foodID,
    this.uuid,
    this.quantity,
    this.status,
    this.time,
    this.food,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    userID: json['user_id'],
    foodID: json['food_id'],
    uuid: json['uuid'],
    quantity: json['quantity'],
    status: json['status'],
    time: DateTime.parse(json['updated_at']),
    food: Food.fromJson(json['food']),
  );

  String get orderTime {
    return "${time.shortMonth} ${time.day}, ${time.hour} : ${time.minute}";
  }

  @override
  List<Object> get props => [
    id,
    userID,
    foodID,
    uuid,
    quantity,
    status,
    time,
    food,
  ];
}
