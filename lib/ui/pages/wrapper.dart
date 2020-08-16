part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) =>
      
      (pageState is OnSplashPage)
      ? SplashPage()

      : (pageState is OnSignInPage)
      ? SignInPage()

      : (pageState is OnSignUpPage)
      ? SignUpPage(pageState.auth)

      : (pageState is OnAddressPage)
      ? AddressPage(pageState.auth)

      : (pageState is OnMainPage)
      ? MainPage(bottomNavBarIndex: pageState.bottomNavBarIndex)

      : (pageState is OnFoodDetailPage)
      ? FoodDetailPage(pageState.food)

      : (pageState is OnCheckoutPage)
      ? CheckoutPage(pageState.food)

      : (pageState is OnSuccessPage)
      ? SuccessPage(pageState.title, pageState.subtitle, pageState.illustrationImage, pageState.isOrder)

      : (pageState is OnOrderDetailPage)
      ? OrderDetailPage(pageState.order)

      : (pageState is OnProfilePage)
      ? ProfilePage()

      : (pageState is OnEditProfilePage)
      ? EditProfilePage(pageState.user)

      : (pageState is OnEditAddressPage)
      ? EditAddressPage(pageState.user)

      : (pageState is OnPaymentMethodPage)
      ? PaymentMethodPage(pageState.order, pageState.transaction, pageState.food)

      : (pageState is OnCreditCardPage)
      ? CreditCardPage(pageState.order, pageState.transaction, pageState.food)

      : (pageState is OnGopayPage)
      ? GopayPage(pageState.order, pageState.transaction, pageState.food)

      : Container()
    );
  }
}