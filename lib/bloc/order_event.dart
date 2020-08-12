part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class GetOrders extends OrderEvent {
  final int userID;

  GetOrders(this.userID);

  @override
  List<Object> get props => [userID];
}

class SaveOrder extends OrderEvent {
  final Order order;
  final Transaction transaction;

  SaveOrder(this.order, this.transaction);

  @override
  List<Object> get props => [order, transaction];
}
