import 'dart:ui';

import 'package:flutter/material.dart';

class ZAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final String? leftBtnTxt;
  final String? rightBtnTxt;
  final TextStyle? titleTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? actionsPadding;
  final MainAxisAlignment? actionsAlignment;
  final VerticalDirection? actionsOverflowDirection;
  final double? actionsOverflowButtonSpacing;

  const ZAlertDialog({
    Key? key,
    this.title,
    this.content,
    this.titleTextStyle,
    this.contentTextStyle,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.actions,
    this.buttonPadding,
    this.actionsPadding = EdgeInsets.zero,
    this.actionsAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.leftBtnTxt,
    this.rightBtnTxt,
  }) : super(key: key);

  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)));

  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final ThemeData theme = Theme.of(context);

// The paddingScaleFactor is used to adjust the padding of Dialog's
    // children.
    final double paddingScaleFactor =
        _paddingScaleFactor(MediaQuery.of(context).textScaleFactor);
    final TextDirection? textDirection = Directionality.maybeOf(context);

    Widget? titleWidget;
    Widget? contentWidget;
    Widget? actionsWidget;
    if (title != null) {
      final EdgeInsets defaultTitlePadding =
          EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0);
      final EdgeInsets effectiveTitlePadding = defaultTitlePadding;
      titleWidget = Padding(
        padding: EdgeInsets.only(
          left: effectiveTitlePadding.left * paddingScaleFactor,
          right: effectiveTitlePadding.right * paddingScaleFactor,
          top: effectiveTitlePadding.top * paddingScaleFactor,
          bottom: effectiveTitlePadding.bottom,
        ),
        child: DefaultTextStyle(
          style: titleTextStyle ??
              dialogTheme.titleTextStyle ??
              theme.textTheme.headline6!,
          child: Semantics(
            container: true,
            child: title,
          ),
        ),
      );
    }

    if (content != null) {
      final EdgeInsets effectiveContentPadding =
          contentPadding!.resolve(textDirection);
      contentWidget = Padding(
        padding: EdgeInsets.only(
          left: effectiveContentPadding.left * paddingScaleFactor,
          right: effectiveContentPadding.right * paddingScaleFactor,
          top: title == null
              ? effectiveContentPadding.top * paddingScaleFactor
              : effectiveContentPadding.top,
          bottom: effectiveContentPadding.bottom,
        ),
        child: DefaultTextStyle(
          style: contentTextStyle ??
              dialogTheme.contentTextStyle ??
              theme.textTheme.subtitle1!,
          child: Semantics(
            container: true,
            child: content,
          ),
        ),
      );
    }

    final double spacing = (buttonPadding?.horizontal ?? 16) / 2;
    actionsWidget = Padding(
      padding: actionsPadding!.add(EdgeInsets.all(spacing)),
      child: OverflowBar(
        alignment: actionsAlignment ?? MainAxisAlignment.end,
        spacing: spacing,
        overflowAlignment: OverflowBarAlignment.end,
        overflowDirection: actionsOverflowDirection ?? VerticalDirection.down,
        overflowSpacing: actionsOverflowButtonSpacing ?? 0,
        children: actions!,
      ),
    );

    Widget dialogChild = IntrinsicWidth(
      stepWidth: 56.0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 280.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (title != null) titleWidget!,
            if (content != null) contentWidget!,
            if (actions != null) actionsWidget,
          ],
        ),
      ),
    );

    return Dialog(
      elevation: _defaultElevation,
      child: dialogChild,
      shape: _defaultDialogShape,
    );
  }
}

double _paddingScaleFactor(double textScaleFactor) {
  final double clampedTextScaleFactor = textScaleFactor.clamp(1.0, 2.0);
  // The final padding scale factor is clamped between 1/3 and 1. For example,
  // a non-scaled padding of 24 will produce a padding between 24 and 8.
  return lerpDouble(1.0, 1.0 / 3.0, clampedTextScaleFactor - 1.0)!;
}
