part of 'widgets.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  HeaderWidget({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: blackFont.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        Text(
          subtitle,
          style: greyFont.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
