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

## z_dialog

[![ZDialog](https://img.shields.io/github/v/tag/hello-ring/z_dialog?style=flat-square)](https://github.com/hello-ring/z_dialog)
[![pub package](https://img.shields.io/pub/v/z_dialog?style=flat-square)](https://pub.dev/packages/z_dialog)

z_dialog is a brief Dialog

## Example
<p>
<img src="https://github.com/hello-ring/z_dialog/blob/master/example/screenshot/2.png?raw=true" width="350" alt="build"></a>
</p>
<p>
<img src="https://github.com/hello-ring/z_dialog/blob/master/example/screenshot/3.png?raw=true" width="350" alt="build"></a>
</p>
<p>
<img src="https://github.com/hello-ring/z_dialog/blob/master/example/screenshot/4.png?raw=true" width="350" alt="build"></a>
</p>

## Usage

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

ZAlert.showBottomDialog(
    context, 
    circular: 12,
    options: ['Ring','Koa','Flutter'],
    onClick: (i, value) {
    Navigator.of(context).pop();
});

ZDialog.showCustomDialog(context,
    title: 'Custom',
    customWidget: Column(
        children: [
        Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.network(
                'https://flutter.cn/asset/flutter-hero-laptop2.png'),
        ),
        Text('Custom Widget')
        ],
    ),
    actions: <Widget>[
        ZButton(
            isDark: true,
            text: 'Ok',
            onPressed: () {
                Navigator.of(context).pop();
            },
        ),
        TextButton(
            onPressed: () {
                Navigator.of(context).pop();
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey),
                ),
            ))
    ]);
```

## information

z_dialog Much of the code references the Flutter Dialog
