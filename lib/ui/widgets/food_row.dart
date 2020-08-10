part of 'widgets.dart';

class FoodRow extends StatelessWidget {
  final Food food;
  final Function onTap;

  FoodRow(this.food, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 8,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(food.picture),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  food.name,
                  style: blackFont.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  NumberFormat.currency(
                    locale: 'id_ID',
                    decimalDigits: 0,
                    symbol: "IDR "
                  ).format(food.price),
                  style: greyFont.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            RatingStars(
              voteAverage: double.parse(food.score),
            ),
          ],
        ),
      ),
    );
  }
}