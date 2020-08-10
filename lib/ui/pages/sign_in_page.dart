part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
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
                      child: HeaderWidget(
                        title: "Sign In",
                        subtitle: "Find your best ever meal", 
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
                            height: 24,
                          ),
                          (isSigningIn) ? SpinKitFadingCircle(color: mainColor) : ButtonWidget(
                            "Sign In",
                            width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                            color: mainColor,
                            onPressed: () async {
                              if (!( emailController.text.trim() != "" && passwordController.text.trim() != "")) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: redColor,
                                  message: "Please fill all the fields",
                                )..show(context);
                              } 
                              else {
                                setState(() {
                                  isSigningIn = true;
                                });

                                ResponseHandler result = await AuthServices.signIn(
                                  Auth(
                                    email: emailController.text, 
                                    password: passwordController.text,
                                  ),
                                );

                                if (result.user != null) {
                                  context.bloc<PageBloc>().add(GoToMainPage());
                                } 
                                else {
                                  setState(() {
                                    isSigningIn = false;
                                  });
                                  
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: redColor,
                                    message: result.message,
                                  )..show(context);
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          ButtonWidget(
                            "Create New Account",
                            width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                            color: greyColor,
                            textColor: whiteColor,
                            onPressed: () {
                              context.bloc<PageBloc>().add(GoToSignUpPage(Auth()));
                            },
                          ),
                          SizedBox(
                            height: 160,
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
    );
  }
}