import 'package:example/utils/color.dart';
import 'package:flutter/material.dart';

class GlobalButton extends StatefulWidget {
  final String? text;
  final bool enable;
  final bool loading;
  final Color textColor;
  final Color bgColor;
  final VoidCallback? onPressed;

  const GlobalButton({
    Key? key,
    this.text,
    this.enable = true,
    this.onPressed,
    this.loading = false,
    this.bgColor = primary,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  _GlobalButtonState createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: MaterialButton(
          color: widget.bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          disabledColor: primaryDisable,
          onPressed: widget.enable ? widget.onPressed : null,
          height: 45,
          child: widget.loading
              ? Container(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    // strokeWidth: ,
                  ),
                )
              : Text(
                  widget.text ?? '',
                  style: TextStyle(color: widget.textColor),
                )),
    );
  }
}
