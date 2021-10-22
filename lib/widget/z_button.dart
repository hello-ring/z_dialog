import 'package:flutter/material.dart';
import 'package:z_dialog/util/color.dart';

class ZButton extends StatefulWidget {
  final String? text;
  final bool enable;
  final bool loading;
  final Color textColor;
  final Color bgColor;
  final VoidCallback? onPressed;
  final bool isConfirm;
  const ZButton({
    Key? key,
    this.text,
    this.enable = true,
    this.onPressed,
    this.loading = false,
    this.bgColor = primaryBlack,
    this.textColor = Colors.white,
    this.isConfirm = false,
  }) : super(key: key);

  @override
  _ZButtonState createState() => _ZButtonState();
}

class _ZButtonState extends State<ZButton> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isConfirm) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          child: Text(widget.text ?? '',
              style: const TextStyle(color: primaryCancelBlack, fontSize: 14)),
          onPressed: widget.enable ? widget.onPressed : null,
        ),
      );
    }

    return MaterialButton(
        color: widget.isConfirm ? widget.bgColor : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        disabledColor: primaryBlack,
        onPressed: widget.enable ? widget.onPressed : null,
        height: 35,
        child: widget.loading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  // strokeWidth: ,
                ),
              )
            : Text(
                widget.text ?? '',
                style: TextStyle(color: widget.textColor, fontSize: 14),
              ));
  }
}
