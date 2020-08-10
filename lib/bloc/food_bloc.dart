import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fudamiku/models/models.dart';
import 'package:fudamiku/services/services.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial());

  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    if (event is FetchFoods) {
      List<Food> foods = await FoodServices.getFoods();

      yield FoodLoaded(foods);
    }
  }
}
