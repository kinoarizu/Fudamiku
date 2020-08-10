part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    startSplashScreen();
    _checkToken();
  }

  startSplashScreen() async {
    var duration = Duration(milliseconds: 5000);

    return Timer(duration, () {
      if (isAuth) {
        if (!(prevPageEvent is GoToMainPage)) {
          prevPageEvent = GoToMainPage();
          context.bloc<PageBloc>().add(GoToMainPage());
        }
      } else {
        context.bloc<PageBloc>().add(GoToSignInPage());
      }
    });
  }

  void _checkToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');

    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splash.png"),
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: mainColor,
              child: Text(
                "FudaMiku",
                style: blackFont.copyWith(
                  height: 1.1,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
