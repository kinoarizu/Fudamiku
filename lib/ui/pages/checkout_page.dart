part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Food food;

  CheckoutPage(this.food);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isOrdering = false;

  @override
  Widget build(BuildContext context) {
    int foodPrice = widget.food.price;
    int driver = 9000;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToFoodDetailPage(widget.food));
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
                                      context.bloc<PageBloc>().add(GoToFoodDetailPage(widget.food));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 26,
                                ),
                                HeaderWidget(
                                  title: "Checkout",
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
                            child: Column(
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
                                          image: NetworkImage(widget.food.picture),
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
                                          widget.food.name,
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
                                          ).format(widget.food.price),
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
                                      widget.food.name,
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
                                        ).format(foodPrice * count),
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
                                      ).format(driver),
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
                                        ).format(foodPrice * count * 0.1),
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
                                        ).format((foodPrice * count) + driver + (foodPrice * count * 0.1)),
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
                          (isOrdering) ? SpinKitFadingCircle(color: mainColor, size: 45) : BlocBuilder<CounterCubit, int>(
                            builder: (_, count) => ButtonWidget(
                              "Checkout Now",
                              width: deviceWidth(context) - 2 * defaultMargin,
                              color: mainColor,
                              onPressed: () async {
                                setState(() {
                                  isOrdering = true;
                                });

                                Order order = Order(
                                  foodID: widget.food.id,
                                  quantity: count,
                                  status: "Delivered",
                                );

                                Transaction transaction = Transaction(
                                  deliveryService: driver,
                                  tax: (foodPrice * count * 0.1).toInt(),
                                  totalPrice: ((foodPrice * count) + driver + (foodPrice * count * 0.1)).toInt(),
                                );

                                return Timer(Duration(seconds: 2), () {
                                  pushOrderNotification(
                                    heading: "Thank You For Ordering Food",
                                    content: "Please wait our delivery service.",
                                  );
                                  context.bloc<OrderBloc>().add(SaveOrder(order, transaction));
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
                              },
                            ),
                          ),
                          SizedBox(
                            height: 26,
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
