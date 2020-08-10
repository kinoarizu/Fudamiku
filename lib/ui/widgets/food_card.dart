part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final Function onTap;

  FoodCard(this.food, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: 200,
        height: 210,
        margin: EdgeInsets.symmetric(vertical: defaultMargin),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(0, 6),
              color: Color(0xFFF2F2F2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(food.picture),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
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
                    height: 4,
                  ),
                  RatingStars(
                    voteAverage: double.parse(food.score),
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