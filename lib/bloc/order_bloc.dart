import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fudamiku/models/models.dart';
import 'package:fudamiku/services/services.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState([]));

  @override
  Stream<OrderState> mapEventToState(
    OrderEvent event,
  ) async* {
    if (event is GetOrders) {
      List<Order> orders = await OrderServices.getOrders(event.userID);

      yield OrderState(orders);
    }
    else if (event is SaveOrder) {
      await OrderServices.saveOrder(event.order, event.transaction);

      List<Order> orders = state.orders + [event.order];

      yield OrderState(orders);
    }
  }
}
