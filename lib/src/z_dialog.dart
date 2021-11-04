import 'package:flutter/material.dart';

import 'z_alert_dialog.dart';

// index  取消:0 ,确认:1
typedef _ClickCallBack = void Function(int selectIndex, String selectText);
typedef _DismissCallBack = void Function();

class ZDialog {
  ///普通弹框

  static void showAlert(BuildContext context,
      {String title = '',
      String content = '',
      String leftText = '取消',
      String rightText = '确认',
      List<Widget>? actions,
      _ClickCallBack? clickCallback,
      _DismissCallBack? dismissCallBack}) async {
    showDialog(
        context: context,
        builder: (context) {
          return ZAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: actions,
          );
        }).then((value) {
      if (dismissCallBack == null) {
        return;
      }
      dismissCallBack.call();
    });
  }

  ///底部弹出框
  static void showBottomDialog(BuildContext context,
      {double circular = 10.0,
      List<String>? options,
      _ClickCallBack? onClick}) async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(circular))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min, //最小尺度占用空间
                  children: options != null
                      ? options
                          .asMap()
                          .map((i, item) {
                            return MapEntry(
                                i,
                                Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        if (onClick != null) {
                                          onClick(i, item);
                                        }
                                      },
                                      title: Center(
                                          child: Text(
                                        item,
                                      )),
                                    )
                                  ],
                                ));
                          })
                          .values
                          .toList()
                      : [],
                ),
                const Divider(
                  height: 1,
                ),
                ListTile(
                  onTap: () {
                    if (onClick != null) {
                      onClick(-1, '取消');
                    }
                  },
                  title: const Center(
                      child: Text(
                    '取消',
                  )),
                )
              ],
            ),
          );
        });
  }

  static void showCustomDialog(BuildContext context,
      {String title = '',
      String content = '',
      String leftText = '取消',
      String rightText = '确认',
      Widget? customWidget,
      List<Widget>? actions,
      _ClickCallBack? clickCallback,
      _DismissCallBack? dismissCallBack}) {
    showDialog(
        context: context,
        builder: (context) {
          return ZAlertDialog(
            title: Text(title),
            customWidget: customWidget,
            actions: actions,
          );
        }).then((value) {
      if (dismissCallBack == null) {
        return;
      }
      dismissCallBack.call();
    });
  }
}
