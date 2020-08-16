part of 'pages.dart';

class EditAddressPage extends StatefulWidget {
  final User user;

  EditAddressPage(this.user);

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  String selectedCity;
  bool isDataEdited;
  bool isUpdating;

  @override
  void initState() { 
    super.initState();
    
    phoneController = TextEditingController(text: widget.user.phoneNumber);
    addressController = TextEditingController(text: widget.user.address);
    houseController = TextEditingController(text: widget.user.houseNumber);
    selectedCity = widget.user.city;
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
                                  title: "Edit Address",
                                  subtitle: "Address for easing delivery",
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
                                    selectedCity,
                                    style: blackFont.copyWith(
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
                                ButtonWidget(
                                  "Change Address",
                                  width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                                  color: mainColor,
                                  onPressed: () {},
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}