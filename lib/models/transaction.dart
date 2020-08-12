part of 'models.dart';

class Transaction extends Equatable {
  final int id;
  final int userID;
  final int orderID;
  final int deliveryService;
  final int tax;
  final int totalPrice;
  final Order order;

  Transaction({
    this.id,
    this.userID,
    this.orderID,
    this.deliveryService,
    this.tax,
    this.totalPrice,
    this.order,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json['id'],
    userID: json['user_id'],
    orderID: json['order_id'],
    deliveryService: json['delivery_service'],
    tax: json['tax'],
    totalPrice: json['total_price'],
    order: Order.fromJson(json['order']),
  );

  @override
  List<Object> get props => [
    id,
    userID,
    orderID,
    deliveryService,
    tax,
    totalPrice,
    order,
  ];
}
