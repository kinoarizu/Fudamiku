part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final Color color;

  RatingStars({
    this.voteAverage = 0,
    this.starSize = 16,
    this.fontSize = 12,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(5, (index) => Icon(
      index < n ? MdiIcons.star : MdiIcons.starOutline,
      color: mainColor,
      size: starSize,
    ));

    widgets.add(
      SizedBox(width: 4)
    );

    widgets.add(
      Text(
        "$voteAverage",
        style: greyFont.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgets,
    );
  }
}