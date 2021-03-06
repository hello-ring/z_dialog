import 'package:flutter/material.dart';
import 'package:z_dialog/z_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            ZButton(
              isDark: true,
              text: 'AlertDialog',
              onPressed: () async {
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
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ZButton(
              isDark: true,
              text: 'BottomDialog',
              onPressed: () async {
                ZDialog.showBottomDialog(context,
                    circular: 12,
                    options: ['Ring', 'Koa', 'Flutter'], onClick: (i, value) {
                  Navigator.of(context).pop();
                });
              },
            ),
            ZButton(
              isDark: true,
              text: 'CustomWidget',
              onPressed: () async {
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
              },
            )
          ],
        ),
      ),
    );
  }
}
