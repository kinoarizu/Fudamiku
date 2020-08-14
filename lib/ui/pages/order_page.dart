part of 'pages.dart';

class OrderPage extends StatefulWidget {
  final int tabBarIndex;

  OrderPage({this.tabBarIndex = 1});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int tabBarIndex;
  String statusOrder = "Delivered";

  @override
  void initState() {
    super.initState();

    tabBarIndex = widget.tabBarIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrderBloc, OrderState>(builder: (_, orderState) {
        if (orderState.orders.length == 0) {
          return SuccessPage(
            "Ouch! Hungry",
            "Seems like you have not\nordered any food yet",
            "assets/images/empty_state.png",
            false,
          );
        } else {
          return ListView(
            children: <Widget>[
              Container(
                width: deviceWidth(context),
                color: whiteColor,
                padding: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, defaultMargin),
                child: HeaderWidget(
                  title: "Your Orders",
                  subtitle: "Wait for the best meal",
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Container(
                color: whiteColor,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: deviceWidth(context),
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFF2F2F2),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                tabBarIndex = 0;
                                statusOrder = "Delivered";
                              });
                            },
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "In Progress",
                                  style: blackFont.copyWith(
                                    fontSize: 14,
                                    fontWeight: (tabBarIndex == 0) ? FontWeight.w500 : FontWeight.w400,
                                    color: (tabBarIndex == 0) ? blackColor : greyColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                (tabBarIndex == 0) ? Container(
                                  width: 40,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ) : Container(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                tabBarIndex = 1;
                                statusOrder = "Paid";
                              });
                            },
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Past Orders",
                                  style: blackFont.copyWith(
                                    fontSize: 14,
                                    fontWeight: (tabBarIndex == 1) ? FontWeight.w500 : FontWeight.w400,
                                    color: (tabBarIndex == 1) ? blackColor : greyColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                (tabBarIndex == 1) ? Container(
                                  width: 40,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ) : Container(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                tabBarIndex = 2;
                                statusOrder = "Cancelled";
                              });
                            },
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Cancelled",
                                  style: blackFont.copyWith(
                                    fontSize: 14,
                                    fontWeight: (tabBarIndex == 2) ? FontWeight.w500 : FontWeight.w400,
                                    color: (tabBarIndex == 2) ? blackColor : greyColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                (tabBarIndex == 2) ? Container(
                                  width: 40,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ) : Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<OrderBloc, OrderState>(
                      builder: (_, orderState) {
                        if (orderState is OrderState) {
                          List<Order> orders = orderState.orders.where((order) => order.status.contains(statusOrder)).toList();

                          return Container(
                            height: (60 * double.parse((orders.length).toString())) + (2 * 8 * double.parse((orders.length).toString())) + 68,
                            padding: EdgeInsets.only(top: 60),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: orders.length,
                              itemBuilder: (_, index) => OrderRow(
                                orders[index],
                                onTap: () {
                                  context.bloc<PageBloc>().add(GoToOrderDetailPage(orders[index]));
                                },
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.only(top: 150),
                            child: SpinKitFadingCircle(
                              color: mainColor,
                              size: 50,
                            ),
                          );
                        }    
                      },                                                               
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          );
        }
      }),
    );
  }
}
