part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignInPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignUpPage extends PageState {
  final Auth auth;

  OnSignUpPage(this.auth);

  @override
  List<Object> get props => [auth];
}

class OnAddressPage extends PageState {
  final Auth auth;

  OnAddressPage(this.auth);

  @override
  List<Object> get props => [auth];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnFoodDetailPage extends PageState {
  final Food food;

  OnFoodDetailPage(this.food);
  
  @override
  List<Object> get props => [food];
}

class OnCheckoutPage extends PageState {
  final Food food;

  OnCheckoutPage(this.food);
  
  @override
  List<Object> get props => [food];
}

class OnSuccessPage extends PageState {
  final String title;
  final String subtitle;
  final String illustrationImage;
  final bool isOrder;

  OnSuccessPage(this.title, this.subtitle, this.illustrationImage, this.isOrder);
  
  @override
  List<Object> get props => [title, subtitle, illustrationImage, isOrder];
}
