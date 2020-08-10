part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final Color color;
  final Color textColor;
  final Function onPressed;

  ButtonWidget(
    this.text, {
    this.width,
    this.color,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      child: RaisedButton(
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: blackFont.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
      ),
    );
  }
}
