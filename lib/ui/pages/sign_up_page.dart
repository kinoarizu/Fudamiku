part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final Auth auth;

  SignUpPage(this.auth);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fullNameController.text = widget.auth.name;
    emailController.text = widget.auth.email;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSignInPage());
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
                                  context.bloc<PageBloc>().add(GoToSignInPage());
                                },
                              ),
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            HeaderWidget(
                              title: "Sign Up",
                              subtitle: "Register and eat",
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
                                      decoration: (widget.auth.photo == null) ? BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        shape: BoxShape.circle,
                                      ) : BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: FileImage(widget.auth.photo),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Center(
                                        child: (widget.auth.photo == null) ? Text(
                                          "Add\nPhoto",
                                          textAlign: TextAlign.center,
                                          style: greyFont.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ) : Text(""),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    
                                    if (widget.auth.photo == null) {
                                      widget.auth.photo = await getImage();
                                    } 
                                    else {
                                      widget.auth.photo = null;
                                    }

                                    setState(() {});
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
                            TextFieldWidget(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: "Email Address",
                              hintText: "Type your email address",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFieldWidget(
                              obscureText: true,
                              controller: passwordController,
                              labelText: "Password",
                              hintText: "Type your password",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFieldWidget(
                              obscureText: true,
                              controller: confirmPasswordController,
                              labelText: "Confirm Password",
                              hintText: "Retype your password",
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            ButtonWidget(
                              "Continue",
                              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                              color: mainColor,
                              onPressed: () {
                                if (!(fullNameController.text.trim() != "" && emailController.text.trim() != "" && passwordController.text.trim() != "" && confirmPasswordController.text.trim() != "")) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: redColor,
                                    message: "Please fill all the fields and photo",
                                  )..show(context);
                                }
                                else if (passwordController.text != confirmPasswordController.text) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: redColor,
                                    message: "Mismatch password and confirmed password",
                                  )..show(context);
                                }
                                else if (passwordController.text.length < 6) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: redColor,
                                    message: "Password's length min 6 characters",
                                  )..show(context);
                                }
                                else if (!EmailValidator.validate(emailController.text)) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: redColor,
                                    message: "Please enter valid email",
                                  )..show(context);
                                }
                                else {
                                  widget.auth.name = fullNameController.text;
                                  widget.auth.email = emailController.text;
                                  widget.auth.password = passwordController.text;
                                  widget.auth.confirmPassword = confirmPasswordController.text;

                                  context.bloc<PageBloc>().add(GoToAddressPage(widget.auth));
                                }
                              },
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
            ),
          ],
        ),
      ),
    );
  }
}
