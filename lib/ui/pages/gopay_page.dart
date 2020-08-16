part of 'pages.dart';

class GopayPage extends StatelessWidget {
  final Order order;
  final Transaction transaction;
  final Food food;

  GopayPage(this.order, this.transaction, this.food);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToPaymentMethodPage(order, transaction, food));
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
                                      context.bloc<PageBloc>().add(GoToPaymentMethodPage(order, transaction, food));
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
                                ButtonWidget(
                                  "Open Gojek Payment App",
                                  width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                                  color: mainColor,
                                  onPressed: () {},
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