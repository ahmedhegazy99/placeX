import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'constants.dart';

class XInputField extends StatelessWidget {
  final double? cSize, oWidth;
  final int? maxLines;
  final String? hintText, labelText;
  final IconData? icon;
  final Color color, backColor;
  final Color textColor, iconColor;
  final FormFieldValidator<String>? validator;
  final bool obscureText, enabled;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  XInputField(
      {Key? key,
      this.cSize = 0.8,
      this.oWidth = 1,
      this.maxLines = 1,
      this.color = backW,
      this.backColor = backP,
      this.textColor = Colors.black,
      this.iconColor = mainP,
      this.hintText,
      this.labelText,
      this.icon,
      this.validator,
      this.obscureText = false,
      this.enabled = true,
      this.controller,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _isObscure = RxBool(true);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.5 * cSize!),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: size.width * (cSize! / 6) * maxLines!,
            width: size.width * cSize! * oWidth!,
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.zero,
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Container(
            //margin: EdgeInsets.symmetric(vertical: 12.5 * cSize!),
            padding: EdgeInsets.symmetric(
                horizontal: 12 * cSize!, vertical: 2 * cSize!),
            height: size.width * (cSize! / 6) * maxLines!,
            width: size.width * cSize! * oWidth!,
            decoration: BoxDecoration(
              color: !enabled ? Colors.grey[200]: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.zero,
              ),
            ),
            child: Obx(() {
              return TextFormField(
                validator: validator,
                controller: controller,
                cursorColor: textColor,
                keyboardType: keyboardType,
                autofocus: true,
                maxLines: maxLines,
                obscureText: obscureText ? _isObscure.value : false.obs.value,
                decoration: InputDecoration(
                    icon: Icon(
                      icon,
                      color: iconColor,
                    ),
                    labelText: labelText,
                    hintText: hintText,
                    border: InputBorder.none,
                    suffixIcon: (() {
                      if (obscureText)
                        return IconButton(
                          icon: Icon(
                            _isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            _isObscure.toggle();
                          },
                        );
                    }())),
                style: TextStyle(
                  fontSize: 20 * cSize!,
                  color: textColor,
                ),
                enabled: enabled,
                readOnly: !enabled,
              );
            }),
          ),
        ]
      ),
    );
  }
}
