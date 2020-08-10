part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  FoodDetailPage(this.food);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        context.bloc<CounterCubit>().setOne();
        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: mainColor,
            ),
            SafeArea(
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 330,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.food.picture),
                              ),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(
                              top: 24,
                              left: 16,
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                CupertinoIcons.back,
                                color: whiteColor,
                                size: 30,
                              ),
                              onPressed: () {
                                context.bloc<PageBloc>().add(GoToMainPage());
                                context.bloc<CounterCubit>().setOne();
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 280),
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
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
                                      height: 4,
                                    ),
                                    RatingStars(
                                      voteAverage: double.parse(widget.food.score),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: blackColor),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: FlatButton(
                                        padding: EdgeInsets.all(0),
                                        child: Text(
                                          "-",
                                          style: blackFont.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () => context.bloc<CounterCubit>().decrement(),
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      child: BlocBuilder<CounterCubit, int>(
                                        builder: (_, count) => Text(
                                          count.toString(),
                                          textAlign: TextAlign.center,
                                          style: blackFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: blackColor),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: FlatButton(
                                        padding: EdgeInsets.all(0),
                                        child: Text(
                                          "+",
                                          style: blackFont.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () => context.bloc<CounterCubit>().increment(),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              widget.food.description,
                              style: greyFont.copyWith(
                                height: 1.7,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Ingredients:",
                                  style: blackFont.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: List.generate(widget.food.ingredients.length, (index) {
                                    String ingredient = widget.food.ingredients[index].name;
                                    
                                    return Text(
                                      (index != widget.food.ingredients.length - 1) ? ingredient + ', ' : ingredient,
                                      style: greyFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Total Price:",
                                      style: greyFont.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: "IDR "
                                      ).format(widget.food.price),
                                      style: blackFont.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                ButtonWidget(
                                  "Order Now",
                                  width: 163,
                                  color: mainColor,
                                  onPressed: () {
                                    context.bloc<PageBloc>().add(GoToCheckoutPage(widget.food));
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
            ),
          ],
        ),
      ),
    );
  }
}
