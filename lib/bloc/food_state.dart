part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoaded extends FoodState {
  final List<Food> foods;

  FoodLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}