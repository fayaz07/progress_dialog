library progress_dialog;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum ProgressDialogType{ CupertinoStyle, Material}

class ProgressDialog {
  bool _isShowing = false;

  BuildContext buildContext, _context;
  String message = "Loading...";
  Widget loadingIndicator;
  ProgressDialogType progressDialogType;
  double loadingIndicatorWidth;

  ProgressDialog(this.buildContext, {
    this.loadingIndicator = const CircularProgressIndicator(),
    this.progressDialogType = ProgressDialogType.CupertinoStyle,
    this.loadingIndicatorWidth = 36.0
  });

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
    Navigator.of(_context).pop();
  }

  Future _showDialog() {
    showDialog<dynamic>(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return progressDialogType == ProgressDialogType.Material ?
        AlertDialog(
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  SizedBox(
                    width: loadingIndicatorWidth,
                    child: loadingIndicator,
                  ),
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
        _context = context;
        return CupertinoAlertDialog(
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  SizedBox(
                    width: loadingIndicatorWidth,
                    child: loadingIndicator,
                  ),
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
