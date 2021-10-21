import 'package:flutter/material.dart';
import 'package:z_dialog/widget/global_button.dart';

class ZButton extends StatelessWidget {
  final bool isConfirm;
  final String? text;
  final VoidCallback? onPressed;
  const ZButton({Key? key, this.text, this.onPressed, this.isConfirm = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      isConfirm: isConfirm,
      text: text,
      onPressed: onPressed,
    );
  }
}
