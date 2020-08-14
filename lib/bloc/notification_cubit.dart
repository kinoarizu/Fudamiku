import 'package:bloc/bloc.dart';

class NotificationCubit extends Cubit<bool> {
  NotificationCubit() : super(false);

  void showBadge() => emit(true);
  void hideBadge() => emit(false);
}
