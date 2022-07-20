import 'constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final int viewIcon;
  final VoidCallback? press;
  final Color color, textColor;
  final double cSize;
  double fontSize, radiusSize = 37.5;

  //const RoundedButton({
  RoundedButton({
    Key? key,
    this.text,
    this.icon,
    this.press,
    this.color = mainP,
    this.textColor = backW,
    this.cSize = 0.4,
    this.fontSize = 40,
  })  : viewIcon = icon != null ? 1 : 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      width: size.width * cSize * 1.5,
      height: size.width * cSize * cSize,
      child: /*ClipRRect(
        borderRadius: BorderRadius.circular(radiusSize * cSize*6),*/
        Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radiusSize * cSize * 6),
            ),
          ),
        child: FlatButton(
          //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          //color: color,
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: size.width * 0.1 * viewIcon, child: icon),

              Text(
                text!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "englishBebas",
                    color: textColor,
                    fontSize: fontSize * cSize * 1.5             //SizedBox(height: size.height * 0.05),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
