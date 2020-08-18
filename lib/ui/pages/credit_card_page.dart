part of 'pages.dart';

class CreditCardPage extends StatefulWidget {
  final Order order;
  final Transaction transaction;
  final Food food;

  CreditCardPage(this.order, this.transaction, this.food);

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireNumberController = TextEditingController();
  TextEditingController cvvNumberController = TextEditingController();

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
                                  title: "Credit Card",
                                  subtitle: "Pay with Visa, MasterCard, JCB, Amex",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Your Credit Card Data",
                                  style: blackFont.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFieldWidget(
                                  controller: cardNumberController,
                                  hintText: "Card Number",
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    MaskTextInputFormatter(
                                      mask: '####-####-####-####',
                                      filter: { "#": RegExp(r'[0-9]') },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 2,
                                      child: TextFieldWidget(
                                        controller: expireNumberController,
                                        hintText: "MM/YY",
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          MaskTextInputFormatter(
                                            mask: '##/##',
                                            filter: { "#": RegExp(r'[0-9]') },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: TextFieldWidget(
                                        controller: cvvNumberController,
                                        hintText: "CVV",
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          MaskTextInputFormatter(
                                            mask: '###',
                                            filter: { "#": RegExp(r'[0-9]') },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Fudamiku Secured Payments",
                                      style: greyFont.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 40,
                                          height: 13,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/visa.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Container(
                                          width: 26,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/mastercard.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Container(
                                          width: 21,
                                          height: 14,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/jcb.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Container(
                                          width: 22,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/discover.png'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 163,
                                    ),
                                    (isPaying) ? SpinKitFadingCircle(size: 50, color: mainColor) : ButtonWidget(
                                      "Pay Now",
                                      width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                                      color: mainColor,
                                      onPressed: () async {
                                        if ((cardNumberController.text == "") || (expireNumberController.text == "") || (cvvNumberController.text == "")) {
                                          Flushbar(
                                            duration: Duration(milliseconds: 1500),
                                            flushbarPosition: FlushbarPosition.TOP,
                                            backgroundColor: redColor,
                                            message: "Please fill your credit card data",
                                          )..show(context);
                                        } else {
                                          List<String> expireCard =  expireNumberController.text.split("/");

                                          setState(() {
                                            isPaying = true;
                                          });

                                          String token = await PaymentServices.getToken(
                                            cardNumber: cardNumberController.text,
                                            expMonth: expireCard[0],
                                            expYear: expireCard[1],
                                            cvv: cvvNumberController.text,
                                          );

                                          ResponseHandler result = await PaymentServices.chargeCreditCard(
                                            amount: widget.transaction.totalPrice,
                                            tokenID: token,
                                          );

                                          if (result.data['transaction_status'] == "capture") {
                                            runTransaction();
                                          } else {
                                            setState(() {
                                              isPaying = false;
                                            });

                                            Flushbar(
                                              duration: Duration(milliseconds: 1500),
                                              flushbarPosition: FlushbarPosition.TOP,
                                              backgroundColor: redColor,
                                              message: result.data['status_message'],
                                            )..show(context);
                                          }
                                        }
                                      },
                                    ),
                                  ],
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