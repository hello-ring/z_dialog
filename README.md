<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## z_dialog

[![ZDialog](https://img.shields.io/badge/OpenFlutter-OKToast-blue.svg)](https://github.com/hello-ring/z_dialog)
[![pub package](https://img.shields.io/pub/v/oktoast.svg)](https://pub.dev/packages/z_dialog)

z_dialog is a brief Dialog

## Getting started

```dart
dependencies:
  z_dialog: ^1.0.0
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
ZDialog.showAlert(context,
    title: 'Flutter',
    content:
        'Flutter is Google UI toolkit for building beautiful, natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase.',
    actions: <Widget>[
        ZButton(
            isDark: true,
            text: '确定',
            onPressed: () {
                Navigator.of(context).pop();
            },
        ),
        ZButton(
            isDark: false,
            text: '取消',
            onPressed: () {
                Navigator.of(context).pop();
            },
        ),
    ]);

ZAlert.showBottomDialog(context, options: ['Ring','Koa','Flutter'],
    onClick: (i, value) {
    Navigator.of(context).pop();
});
```

## information

z_dialog Much of the code references the Flutter Dialog
