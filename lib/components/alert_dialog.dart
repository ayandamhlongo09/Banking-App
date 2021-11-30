import 'dart:ui';
import 'package:flutter/material.dart';

class CustomAlertDialog {
  static Future<void> okDialog({
    @required BuildContext context,
    String title,
    @required String content,
    String okButtonText = 'OK',
    void Function() onOKPressed,
  }) async {
    // create alert
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
      ),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(
            okButtonText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            onOKPressed?.call(); // call function if exists
          },
        ),
      ],
    );
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Theme(
            data: ThemeData.light(),
            child: alert,
          );
        });
  }

  /// Show a confirm with a confirm and cancel option
  static Future<void> okAndCancelDialog({
    @required BuildContext context,
    @required String title,
    @required Widget content,
    String confirmButtonText = 'OK',
    String cancelButtonText = 'CANCEL',
    void Function() onConfirm,
    void Function() onCancel,
  }) async {
    // create alert
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: content,
      actions: [
        TextButton(
          child: Text(cancelButtonText,
              style: TextStyle(color: Theme.of(context).primaryColor)),
          onPressed: () {
            Navigator.pop(context);
            onCancel?.call(); // call function if exists
          },
        ),
        TextButton(
          child: Text(
            confirmButtonText,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pop(context);
            onConfirm?.call(); // call function if exists
          },
        ),
      ],
    );

    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Theme(
            data: ThemeData.light(),
            child: alert,
          );
        });
  }
}

class PopUpDialog {
  static Future<void> okDialog({
    @required BuildContext context,
    String title,
    @required Widget content,
    String okButtonText = 'OK',
    void Function() onOKPressed,
  }) async {
    // create alert
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
      ),
      content: content,
      actions: [
        TextButton(
          child: Text(
            okButtonText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            onOKPressed?.call(); // call function if exists
          },
        ),
      ],
    );
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Theme(
            data: ThemeData.light(),
            child: alert,
          );
        });
  }

  /// Show a confirm with a confirm and cancel option
  static Future<void> okAndCancelDialog({
    @required BuildContext context,
    @required String title,
    @required Widget content,
    String confirmButtonText = 'OK',
    String cancelButtonText = 'CANCEL',
    void Function() onConfirm,
    void Function() onCancel,
  }) async {
    // create alert
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: content,
      actions: [
        TextButton(
          child: Text(
            cancelButtonText,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
            onCancel?.call(); // call function if exists
          },
        ),
        TextButton(
          child: Text(
            confirmButtonText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            onConfirm?.call(); // call function if exists
            // Navigator.pop(context);
          },
        ),
      ],
    );

    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Theme(
            data: ThemeData.light(),
            child: alert,
          );
        });
  }
}
