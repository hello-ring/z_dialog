import 'package:flutter/material.dart';
import 'package:z_dialog/util/color.dart';

class ZButton extends StatelessWidget {
  final String? text;
  final bool enable;
  final Color textColor;
  final Color? bgColor;
  final VoidCallback? onPressed;
  final bool isDark;
  const ZButton({
    Key? key,
    this.text,
    this.enable = true,
    this.onPressed,
    this.bgColor,
    this.textColor = Colors.white,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isDark) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          child: Text(text ?? '',
              style: const TextStyle(color: primaryCancelBlack, fontSize: 14)),
          onPressed: enable ? onPressed : null,
        ),
      );
    }

    Color useBgColor;
    if (bgColor != null) {
      useBgColor = bgColor!;
    } else {
      if (isDark) {
        useBgColor = primaryBlack;
      } else {
        useBgColor = Colors.white;
      }
    }

    return MaterialButton(
        color: useBgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        disabledColor: primaryBlack,
        onPressed: enable ? onPressed : null,
        height: 35,
        child: Text(
          text ?? '',
          style: TextStyle(color: textColor, fontSize: 14),
        ));
  }
}
