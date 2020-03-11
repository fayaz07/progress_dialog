import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ProgressDialogType { Normal, Download }

String _dialogMessage = "Loading...";
double _progress = 0.0, _maxProgress = 100.0;

bool _isShowing = false;
BuildContext _context, _dismissingContext;
ProgressDialogType _progressDialogType;
bool _barrierDismissible = true, _showLogs = false;

TextStyle _progressTextStyle = TextStyle(
        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    _messageStyle = TextStyle(
        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600);

double _dialogElevation = 8.0, _borderRadius = 8.0;
Color _backgroundColor = Colors.white;
Curve _insetAnimCurve = Curves.easeInOut;

Widget _progressWidget = Image.asset(
  'assets/double_ring_loading_io.gif',
  package: 'progress_dialog',
);

class ProgressDialog {
  _Body _dialog;

  ProgressDialog(BuildContext context,
      {ProgressDialogType type, bool isDismissible, bool showLogs}) {
    _context = context;
    _progressDialogType = type ?? ProgressDialogType.Normal;
    _barrierDismissible = isDismissible ?? true;
    _showLogs = showLogs ?? false;
  }

  void style(
      {double progress,
      double maxProgress,
      String message,
      Widget progressWidget,
      Color backgroundColor,
      TextStyle progressTextStyle,
      TextStyle messageTextStyle,
      double elevation,
      double borderRadius,
      Curve insetAnimCurve}) {
    if (_isShowing) return;
    if (_progressDialogType == ProgressDialogType.Download) {
      _progress = progress ?? _progress;
    }

    _dialogMessage = message ?? _dialogMessage;
    _maxProgress = maxProgress ?? _maxProgress;
    _progressWidget = progressWidget ?? _progressWidget;
    _backgroundColor = backgroundColor ?? _backgroundColor;
    _messageStyle = messageTextStyle ?? _messageStyle;
    _progressTextStyle = progressTextStyle ?? _progressTextStyle;
    _dialogElevation = elevation ?? _dialogElevation;
    _borderRadius = borderRadius ?? _borderRadius;
    _insetAnimCurve = insetAnimCurve ?? _insetAnimCurve;
  }

  void update(
      {double progress,
      double maxProgress,
      String message,
      Widget progressWidget,
      TextStyle progressTextStyle,
      TextStyle messageTextStyle}) {
    if (_progressDialogType == ProgressDialogType.Download) {
      _progress = progress ?? _progress;
    }

    _dialogMessage = message ?? _dialogMessage;
    _maxProgress = maxProgress ?? _maxProgress;
    _progressWidget = progressWidget ?? _progressWidget;
    _messageStyle = messageTextStyle ?? _messageStyle;
    _progressTextStyle = progressTextStyle ?? _progressTextStyle;

    if (_isShowing) _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void dismiss() {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(_dismissingContext).canPop()) {
          Navigator.of(_dismissingContext).pop();
          if (_showLogs) debugPrint('ProgressDialog dismissed');
        } else {
          if (_showLogs) debugPrint('Cant pop ProgressDialog');
        }
      } catch (_) {}
    } else {
      if (_showLogs) debugPrint('ProgressDialog already dismissed');
    }
  }

  Future<bool> hide() {
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.of(_dismissingContext).pop(true);
        if (_showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } catch (_) {
        return Future.value(false);
      }
    } else {
      if (_showLogs) debugPrint('ProgressDialog already dismissed');
      return Future.value(false);
    }
  }

  Future<bool> show() async {
    if (!_isShowing) {
      try {
        _dialog = new _Body();
        showDialog<dynamic>(
          context: _context,
          barrierDismissible: _barrierDismissible,
          builder: (BuildContext context) {
            _dismissingContext = context;
            return WillPopScope(
              onWillPop: () async => _barrierDismissible,
              child: Dialog(
                  backgroundColor: _backgroundColor,
                  insetAnimationCurve: _insetAnimCurve,
                  insetAnimationDuration: Duration(milliseconds: 100),
                  elevation: _dialogElevation,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(_borderRadius))),
                  child: _dialog),
            );
          },
        );
        // Delaying the function for 200 milliseconds
        // [Default transitionDuration of DialogRoute]
        await Future.delayed(Duration(milliseconds: 200));
        if (_showLogs) debugPrint('ProgressDialog shown');
        _isShowing = true;
        return true;
      } catch (_) {
        return false;
      }
    } else {
      if (_showLogs) debugPrint("ProgressDialog already shown/showing");
      return false;
    }
  }
}

// ignore: must_be_immutable
class _Body extends StatefulWidget {
  _BodyState _dialog = _BodyState();

  update() {
    _dialog.update();
  }

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyState extends State<_Body> {
  update() {
    setState(() {});
  }

  @override
  void dispose() {
    _isShowing = false;
    if (_showLogs) debugPrint('ProgressDialog dismissed by back button');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(children: <Widget>[
        const SizedBox(width: 10.0),
        SizedBox(
          width: 60.0,
          height: 60.0,
          child: _progressWidget,
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: _progressDialogType == ProgressDialogType.Normal
              ? Text(_dialogMessage,
                  textAlign: TextAlign.justify, style: _messageStyle)
              : Stack(
                  children: <Widget>[
                    Positioned(
                      child: Text(_dialogMessage, style: _messageStyle),
                      top: 30.0,
                    ),
                    Positioned(
                      child: Text("$_progress/$_maxProgress",
                          style: _progressTextStyle),
                      bottom: 10.0,
                      right: 10.0,
                    ),
                  ],
                ),
        ),
        const SizedBox(width: 10.0)
      ]),
    );
  }
}
