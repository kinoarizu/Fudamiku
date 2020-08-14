part of 'pages.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;

  OrderDetailPage(this.order);

  @override
  Widget build(BuildContext context) {
    Transaction transaction;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 1));
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
                                      context.bloc<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 1));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 26,
                                ),
                                HeaderWidget(
                                  title: "History",
                                  subtitle: "You deserve better meal",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Container(
                            width: deviceWidth(context),
                            color: whiteColor,
                            padding: EdgeInsets.only(
                              top: 16,
                              left: defaultMargin,
                              right: defaultMargin,
                            ),
                            child: FutureBuilder(
                              future: TransactionServices.getTransaction(order.id),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  transaction = snapshot.data;

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Item Ordered",
                                        style: blackFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(order.food.picture),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                order.food.name,
                                                style: blackFont.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  decimalDigits: 0,
                                                  symbol: "IDR ",
                                                ).format(order.food.price),
                                                style: greyFont.copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          BlocBuilder<CounterCubit, int>(
                                            builder: (_, count) => Text(
                                              "${count.toString()} items",
                                              style: greyFont.copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Details Transaction",
                                        style: blackFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            order.food.name,
                                            style: greyFont.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          BlocBuilder<CounterCubit, int>(
                                            builder: (_, count) => Text(
                                              NumberFormat.currency(
                                                locale: 'id_ID',
                                                decimalDigits: 0,
                                                symbol: "IDR ",
                                              ).format(order.food.price * order.quantity),
                                              style: blackFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Driver",
                                            style: greyFont.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: "IDR ",
                                            ).format(transaction.deliveryService),
                                            style: blackFont.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Tax 10%",
                                            style: greyFont.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          BlocBuilder<CounterCubit, int>(
                                            builder: (_, count) => Text(
                                              NumberFormat.currency(
                                                locale: 'id_ID',
                                                decimalDigits: 0,
                                                symbol: "IDR ",
                                              ).format(transaction.tax),
                                              style: blackFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Total Price",
                                            style: greyFont.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          BlocBuilder<CounterCubit, int>(
                                            builder: (_, count) => Text(
                                              NumberFormat.currency(
                                                locale: 'id_ID',
                                                decimalDigits: 0,
                                                symbol: "IDR ",
                                              ).format(transaction.totalPrice),
                                              style: greenFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  );
                                } else {
                                  return SizedBox(
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: mainColor,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Container(
                            width: deviceWidth(context),
                            color: whiteColor,
                            padding: EdgeInsets.only(
                              top: 16,
                              left: defaultMargin,
                              right: defaultMargin,
                            ),
                            child: BlocBuilder<UserBloc, UserState>(
                              builder: (_, userState) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Deliver To:",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Name",
                                        style: greyFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        (userState as UserLoaded).user.name,
                                        style: blackFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Phone No.",
                                        style: greyFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        (userState as UserLoaded).user.phoneNumber,
                                        style: blackFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Address",
                                        style: greyFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        (userState as UserLoaded).user.address,
                                        style: blackFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "House No.",
                                        style: greyFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        (userState as UserLoaded).user.houseNumber,
                                        style: blackFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "City",
                                        style: greyFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        (userState as UserLoaded).user.city,
                                        style: blackFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Container(
                            width: deviceWidth(context),
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
                                  "Order Status:",
                                  style: blackFont.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 80,
                                      child: Text(
                                        "#${order.uuid.toUpperCase()}",
                                        maxLines: 1,
                                        style: greyFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      order.status,
                                      style: blackFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: (order.status == "Cancelled") ? redColor : greenColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          (order.status != "Cancelled") ? ButtonWidget(
                            "Cancel My Order",
                            width: deviceWidth(context) - 2 * defaultMargin,
                            color: redColor,
                            textColor: whiteColor,
                            onPressed: () {
                              Order order = Order(
                                id: this.order.id,
                                status: "Cancelled",
                              );

                              pushOrderNotification(
                                heading: "You Have Cancelled Order",
                                content: "Thanks for using our service",
                              );

                              context.bloc<OrderBloc>().add(CancelOrder(order));
                              context.bloc<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 1));
                            },
                          ) : Container(),
                          (order.status != "Cancelled") ? SizedBox(
                            height: defaultMargin,
                          ) : Container(),
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
