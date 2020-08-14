part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String illustrationImage;
  final bool isOrder;

  SuccessPage(this.title, this.subtitle, this.illustrationImage, this.isOrder);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return;
      },
      child: Scaffold(
        backgroundColor: screenColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(illustrationImage),
                  ),
                ),
              ),
              Text(
                title,
                style: blackFont.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: greyFont.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ButtonWidget(
                (!isOrder) ? "Find Foods" : "Order Other Foods",
                color: mainColor,
                width: 200,
                onPressed: () {
                  context.bloc<PageBloc>().add(GoToMainPage());
                },
              ),
              (isOrder) ? SizedBox(
                height: 12,
              ) : SizedBox(),
              (isOrder) ? ButtonWidget(
                "View My Order",
                color: greyColor,
                textColor: whiteColor,
                width: 200,
                onPressed: () {
                  context.bloc<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 1));
                },
              ) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
