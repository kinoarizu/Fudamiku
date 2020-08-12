part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;

  MainPage({this.bottomNavBarIndex = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    _loadData();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  void _loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userID = preferences.getInt('id');

    context.bloc<UserBloc>().add(LoadUser(userID));
    context.bloc<OrderBloc>().add(GetOrders(userID));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
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
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      bottomNavBarIndex = index;
                    });
                  },
                  children: <Widget>[
                    HomePage(tabBarIndex: 0),
                    OrderPage(tabBarIndex: 0),
                    //* Profile Page
                  ],
                ),
                createCustomBottomNavbar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createCustomBottomNavbar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        color: whiteColor,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: mainColor,
          unselectedItemColor: Color(0xFFE5E5E5),
          currentIndex: bottomNavBarIndex,
          onTap: (index) {
            setState(() {
              bottomNavBarIndex = index;
              pageController.jumpToPage(index);
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Container(
                height: 0,
                child: Text(""),
              ),
              icon: Container(
                height: 32,
                child: Image.asset(
                  (bottomNavBarIndex == 0)
                  ? "assets/images/ic_home.png"
                  : "assets/images/ic_home_normal.png",
                ),
              ),
            ),
            BottomNavigationBarItem(
              title: Container(
                height: 0,
                child: Text(""),
              ),
              icon: Container(
                height: 32,
                child: Image.asset(
                  (bottomNavBarIndex == 1)
                  ? "assets/images/ic_order.png"
                  : "assets/images/ic_order_normal.png",
                ),
              ),
            ),
            BottomNavigationBarItem(
              title: Container(
                height: 0,
                child: Text(""),
              ),
              icon: Container(
                height: 32,
                child: Image.asset(
                  (bottomNavBarIndex == 2)
                  ? "assets/images/ic_profile.png"
                  : "assets/images/ic_profile_normal.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
