part of 'pages.dart';

class GopayPage extends StatefulWidget {
  final Order order;
  final Transaction transaction;
  final Food food;

  GopayPage(this.order, this.transaction, this.food);

  @override
  _GopayPageState createState() => _GopayPageState();
}

class _GopayPageState extends State<GopayPage> {
  bool isPaying = false;

  Timer runTransaction() {
    return Timer(Duration(seconds: 2), () {
      pushOrderNotification(
        heading: "Thank You For Ordering Food",
        content: "Please wait our delivery service.",
      );
      context.bloc<OrderBloc>().add(SaveOrder(widget.order, widget.transaction));
      context.bloc<CounterCubit>().setOne();
      context.bloc<NotificationCubit>().showBadge();
      context.bloc<PageBloc>().add(
        GoToSuccessPage(
          title: "You’ve Made Order",
          subtitle: "Just stay at home while we are\npreparing your best foods",
          illustrationImage: "assets/images/order_confirmed.png",
          isOrder: true,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToPaymentMethodPage(widget.order, widget.transaction, widget.food));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: mainColor,
            ),
            SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    color: screenColor,
                  ),
                  ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: deviceWidth(context),
                            color: whiteColor,
                            padding: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, defaultMargin),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    child: Icon(
                                      CupertinoIcons.back,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      context.bloc<PageBloc>().add(GoToPaymentMethodPage(widget.order, widget.transaction, widget.food));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 26,
                                ),
                                HeaderWidget(
                                  title: "Gopay Wallet",
                                  subtitle: "Pay with your Gojek Payment App",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Container(
                            width: deviceWidth(context),
                            height: 484,
                            color: whiteColor,
                            padding: EdgeInsets.only(
                              top: 16,
                              left: defaultMargin,
                              right: defaultMargin,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Gopay App Redirect",
                                  style: blackFont.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  width: 250,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/gopay.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  "You will be redirected to Gojek Payment App Page,\nMake sure you've installed Gojek App.",
                                  textAlign: TextAlign.center,
                                  style: greyFont.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 223,
                                ),
                                (isPaying) ? SpinKitFadingCircle(size: 50, color: mainColor) : ButtonWidget(
                                  "Open Gojek Payment App",
                                  width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                                  color: mainColor,
                                  onPressed: () async {
                                    setState(() {
                                      isPaying = true;
                                    });

                                    ResponseHandler result = await PaymentServices.chargeGopay(widget.transaction.totalPrice);

                                    if (result.data['name'] == "deeplink-redirect") {
                                      runTransaction();

                                      await launch(result.data['url']);
                                    } else {
                                      setState(() {
                                        isPaying = false;
                                      });

                                      Flushbar(
                                        duration: Duration(milliseconds: 1500),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: redColor,
                                        message: "Failed to charge gopay",
                                      )..show(context);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}