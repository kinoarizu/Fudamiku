part of 'pages.dart';

class HomePage extends StatefulWidget {
  final int tabBarIndex;

  HomePage({this.tabBarIndex = 0});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabBarIndex;
  int startSub = 0;
  int endSub = 3;

  @override
  void initState() {
    super.initState();

    tabBarIndex = widget.tabBarIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              HeaderWidget(
                title: "FudaMiku",
                subtitle: "Let's get some foods",
              ),
              BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                if (userState is UserLoaded) {
                  return GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(userState.user.photo),
                        ),
                      ),
                    ),
                    onTap: () async {
                      AuthServices.signOut();
                      context.bloc<PageBloc>().add(GoToSplashPage());
                    },
                  );
                } else {
                  return SpinKitFadingCircle(
                    color: mainColor,
                    size: 50,
                  );
                }
              }),
            ],
          ),
        ),
        Container(
          height: 258,
          child: BlocBuilder<FoodBloc, FoodState>(
            builder: (_, foodState) {
              if (foodState is FoodLoaded) {
                List<Food> foods = foodState.foods.sublist(0, 8);

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foods.length,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                      left: (index == 0) ? defaultMargin : 0,
                      right: defaultMargin,
                    ),
                    child: FoodCard(
                      foods[index],
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToFoodDetailPage(foods[index]));
                      },
                    ),
                  ),
                );
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
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
                          startSub = 0;
                          endSub = 3;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Text(
                            "New Taste",
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
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          tabBarIndex = 1;
                          startSub = 3;
                          endSub = 5;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Popular",
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
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          tabBarIndex = 2;
                          startSub = 5;
                          endSub = 8;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Recommended",
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
              BlocBuilder<FoodBloc, FoodState>(
                builder: (_, foodState) {
                  if (foodState is FoodLoaded) {
                    List<Food> foods = foodState.foods.sublist(startSub, endSub);

                    return Container(
                      height: 60 * double.parse(foods.length.toString()) + 120,
                      margin: EdgeInsets.only(top: 60),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: foods.length,
                        itemBuilder: (_, index) => FoodRow(
                          foods[index],
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToFoodDetailPage(foods[index]));
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
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}
