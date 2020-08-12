part of 'order_bloc.dart';

class OrderState extends Equatable {
  final List<Order> orders;

  OrderState(this.orders);
  
  @override
  List<Object> get props => [orders];
}
