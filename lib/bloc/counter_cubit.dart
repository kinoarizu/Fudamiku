import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(1);

  void setOne() => emit(1);
  void increment() => emit(state + 1);
  void decrement() => emit((state <= 1) ? setOne : state - 1);
}
