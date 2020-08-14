part of 'widgets.dart';

class OrderRow extends StatelessWidget {
  final Order order;
  final Function onTap;

  OrderRow(this.order, {this.onTap});

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
                  image: NetworkImage(order.food.picture),
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
                  order.food.name,
                  style: blackFont.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      order.quantity.toString() + ' items • ' ,
                      style: greyFont.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: "IDR "
                      ).format(order.food.price),
                      style: greyFont.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  order.orderTime,
                  style: greyFont.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                (order.status == "Cancelled") ? SizedBox(
                  height: 2,
                ) : SizedBox(),
                (order.status == "Cancelled") ? Text(
                  "Cancelled",
                  style: redFont.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ) : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}