part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  EditProfilePage(this.user);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController fullNameController;
  String profilePath;
  bool isDataEdited;
  File profileImageFile;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.user.name);
    profilePath = widget.user.photo;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 2));
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
                                      context.bloc<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 2));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 26,
                                ),
                                HeaderWidget(
                                  title: "Edit Profile",
                                  subtitle: "Profile for easing delivery",
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
                              top: 26,
                              left: defaultMargin,
                              right: defaultMargin,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: DottedBorder(
                                        dashPattern: [10, 10],
                                        color: greyColor,
                                        padding: EdgeInsets.all(10),
                                        borderType: BorderType.Circle,
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          child: (profileImageFile != null) 
                                          ? Image.file(
                                              profileImageFile,
                                              fit: BoxFit.cover,
                                            ) 
                                          : ((profilePath == siteURL) || (profilePath == "")) 
                                          ? Image.asset(
                                              'assets/images/photo.png',
                                              fit: BoxFit.cover,
                                            ) 
                                          : CachedNetworkImage(
                                            imageUrl: widget.user.photo,
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
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        if ((profilePath == siteURL) || (profilePath == "")) {
                                          profileImageFile = await getImage();

                                          if (profileImageFile != null) {
                                            profilePath = path.basename(profileImageFile.path);
                                          }
                                        } else {
                                          profileImageFile = null;
                                          profilePath = "";
                                        }

                                        setState(() {
                                          isDataEdited = (fullNameController.text.trim() != widget.user.name || profilePath != widget.user.photo) ? true : false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFieldWidget(
                                  controller: fullNameController,
                                  labelText: "Full Name",
                                  hintText: "Type your full name",
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Email Address",
                                      textAlign: TextAlign.start,
                                      style: greyFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    AbsorbPointer(
                                      child: TextField(
                                        controller: TextEditingController(text: widget.user.email),
                                        keyboardType: TextInputType.emailAddress,
                                        style: greyFont.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: greyColor),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 84,
                                ),
                                ButtonWidget(
                                  "Change Profile",
                                  width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                                  color: mainColor,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: 45,
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