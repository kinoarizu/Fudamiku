part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final Auth auth;

  AddressPage(this.auth);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  bool isSigningUp = false;
  String selectedCity;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSignUpPage(widget.auth));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: screenColor,
            ),
            SafeArea(
              child: ListView(
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
                                  context.bloc<PageBloc>().add(GoToSignUpPage(widget.auth));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            HeaderWidget(
                              title: "Address",
                              subtitle: "Make sure it's valid", 
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFieldWidget(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              labelText: "Phone No.",
                              hintText: "Type your phone number",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFieldWidget(
                              controller: addressController,
                              labelText: "Address",
                              hintText: "Type your address",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFieldWidget(
                              controller: houseController,
                              keyboardType: TextInputType.number,
                              labelText: "House No.",
                              hintText: "Type your house number",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "City",
                              style: blackFont.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            DropdownButtonFormField(
                              hint: Text(
                                "Select your city",
                                style: greyFont.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blackColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              items: cities.map((City city) {
                                return DropdownMenuItem(
                                  child: Text(
                                    city.name,
                                    style: blackFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  value: city,
                                );
                              }).toList(),
                              onChanged: (City city) {
                                setState(() {
                                  selectedCity = city.name;
                                });
                              },
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            (isSigningUp) ? SpinKitFadingCircle(color: mainColor, size: 45) : ButtonWidget(
                              "Sign Up Now",
                              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                              color: mainColor,
                              onPressed: () async {
                                if (!(phoneController.text.trim() != "" && addressController.text.trim() != "" && houseController.text.trim() != "" && selectedCity != null)) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: redColor,
                                    message: "Please fill all the fields",
                                  )..show(context);
                                } else {
                                  setState(() {
                                    isSigningUp = true;
                                  });
                                  
                                  ResponseHandler result = await AuthServices.signUp(
                                    Auth(
                                      name: widget.auth.name,
                                      email: widget.auth.email,
                                      password: widget.auth.password,
                                      confirmPassword: widget.auth.confirmPassword,
                                      address: addressController.text,
                                      phoneNumber: phoneController.text,
                                      houseNumber: houseController.text,
                                      city: selectedCity,
                                      photo: widget.auth.photo,
                                    ),
                                  );

                                  if (result.user == null) {
                                    setState(() {
                                      isSigningUp = false;
                                    });

                                    Flushbar(
                                      duration: Duration(milliseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: redColor,
                                      message: result.errors,
                                    )..show(context);
                                  } else {
                                    context.bloc<PageBloc>().add(
                                      GoToSuccessPage(
                                        title: "Yeay! Completed",
                                        subtitle: "Now you are able to order\nsome foods as a self-reward",
                                        illustrationImage: "assets/images/auth_confirmed.png",
                                        isOrder: false,
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 85,
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