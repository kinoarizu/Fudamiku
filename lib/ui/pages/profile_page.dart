part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int tabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) => Container(
              width: deviceWidth(context),
              color: whiteColor,
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: defaultMargin,
              ),
              child: Column(
                children: <Widget>[
                  DottedBorder(
                    dashPattern: [10, 10],
                    color: greyColor,
                    padding: EdgeInsets.all(10),
                    borderType: BorderType.Circle,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: ((userState as UserLoaded).user.photo == siteURL) ? BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/avatar.png'),
                        ),
                      ) : BoxDecoration(),
                      child: ((userState as UserLoaded).user.photo != siteURL) ? CachedNetworkImage(
                        imageUrl: (userState as UserLoaded).user.photo,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(
                          Icons.verified_user,
                          color: mainColor,
                          size: 45,
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ) : SizedBox(),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    (userState as UserLoaded).user.name,
                    style: blackFont.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    (userState as UserLoaded).user.email,
                    style: greyFont.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
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
            height: 232,
            color: whiteColor,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 37,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            tabBarIndex = 0;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Account",
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
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Fudamiku",
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
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) => Column(
                      children: <Widget>[
                        (tabBarIndex == 0) ? Column(
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToEditProfilePage((userState as UserLoaded).user));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Edit Profile",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: greyColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToEditAddressPage((userState as UserLoaded).user));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Home Address",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: greyColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Security",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: greyColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Payments",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: greyColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                AuthServices.signOut();
                                context.bloc<PageBloc>().add(GoToSignInPage());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Sign Out",
                                    style: redFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: Colors.transparent,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ) : Column(
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Rate App",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: greyColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Help Center",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: greyColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Privacy & Policy",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: greyColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Terms & Conditions",
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: greyColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
