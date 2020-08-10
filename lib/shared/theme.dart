part of 'shared.dart';

const double defaultMargin = 24;

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

Color mainColor = Color(0xFFFFC700);
Color greyColor = Color(0xFF8D92A3);
Color redColor = Color(0xFFD9435E);
Color greenColor = Color(0xFF1ABC9C);
Color whiteColor = Color(0xFFFFFFFF);
Color blackColor = Color(0xFF000000);
Color screenColor = Color(0xFFFAFAFC);

TextStyle blackFont = TextStyle(
  fontFamily: "Poppins",
  color: Colors.black,
);

TextStyle greyFont = TextStyle(
  fontFamily: "Poppins",
  color: greyColor,
);

TextStyle greenFont = TextStyle(
  fontFamily: "Poppins",
  color: greenColor,
);

TextStyle redFont = TextStyle(
  fontFamily: "Poppins",
  color: redColor,
);
