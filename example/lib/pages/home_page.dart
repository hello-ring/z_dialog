import 'package:example/widgets/global_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z_dialog/z_dialog.dart';

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
            GlobalButton(
              text: 'AlertDialog',
              onPressed: () async {
                ZDialog.showAlert(context,
                    title: 'Flutter',
                    content:
                        'Flutter is Google UI toolkit for building beautiful, natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase.',
                    actions: <Widget>[
                      ZButton(
                        isConfirm: true,
                        text: '确定',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ZButton(
                        isConfirm: false,
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
            GlobalButton(
              text: 'BottomDialog',
              onPressed: () async {
                ZDialog.showBottomDialog(context,
                    options: ['Ring', 'Koa', 'Flutter'], onClick: (i, value) {
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
