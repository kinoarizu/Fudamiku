part of 'widgets.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Function onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  TextFieldWidget({
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        (labelText != null) ? Text(
          labelText,
          style: blackFont.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ) : SizedBox(),
        SizedBox(
          height: 6,
        ),
        TextField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          style: blackFont.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greenColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: blackColor),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            hintStyle: greyFont,
          ),
          inputFormatters: inputFormatters,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
