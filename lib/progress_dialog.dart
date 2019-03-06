library progress_dialog;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProgressDialog {
  bool _isShowing = false;

  BuildContext buildContext;
  String message = "Loading...";
  Widget loadingIndicator;

  ProgressDialog(this.buildContext, {this.loadingIndicator = const CircularProgressIndicator()});

  void setMessage(String mess) {
    this.message = mess;
  }

  void show() {
    _showDialog();
    _isShowing = true;
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    _isShowing = false;
    Navigator.pop(buildContext);
  }

  Future _showDialog() {
    showDialog<dynamic>(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Platform.isAndroid ?
          AlertDialog(
            content: SizedBox(
              height: 45.0,
              child: Center(
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 10.0),
                    loadingIndicator,
                    const SizedBox(width: 20.0),
                    Text(
                      message,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    )
                  ],
                ),
              ),
            ),
          ) :
          CupertinoAlertDialog(
            content: SizedBox(
              height: 45.0,
              child: Center(
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 10.0),
                    loadingIndicator,
                    const SizedBox(width: 20.0),
                    Text(
                      message,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    )
                  ],
                ),
              ),
            ),
          );
      },
    );
    return null;
  }
}
