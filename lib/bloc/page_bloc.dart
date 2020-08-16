import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fudamiku/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnSplashPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    }
    else if (event is GoToSignInPage) {
      yield OnSignInPage();
    }
    else if (event is GoToSignUpPage) {
      yield OnSignUpPage(event.auth);
    }
    else if (event is GoToAddressPage) {
      yield OnAddressPage(event.auth);
    }
    else if (event is GoToMainPage) {
      yield OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex);
    }
    else if (event is GoToFoodDetailPage) {
      yield OnFoodDetailPage(event.food);
    }
    else if (event is GoToCheckoutPage) {
      yield OnCheckoutPage(event.food);
    }
    else if (event is GoToSuccessPage) {
      yield OnSuccessPage(event.title, event.subtitle, event.illustrationImage, event.isOrder);
    }
    else if (event is GoToOrderDetailPage) {
      yield OnOrderDetailPage(event.order);
    }
    else if (event is GoToProfilePage) {
      yield OnProfilePage();
    }
    else if (event is GoToEditProfilePage) {
      yield OnEditProfilePage(event.user);
    }
    else if (event is GoToEditAddressPage) {
      yield OnEditAddressPage(event.user);
    }
  }
}
