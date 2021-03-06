import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:lunasea/core.dart';

enum SNACKBAR_TYPE {
    success,
    failure,
    info,
}

const _LEFT_PADDING = 8.0;

// ignore: non_constant_identifier_names
Future<void> LSSnackBar({
    @required BuildContext context,
    @required String message,
    String title,
    Duration duration,
    SNACKBAR_TYPE type = SNACKBAR_TYPE.info,
    bool showButton = false,
    String buttonText = 'view',
    Function buttonOnPressed,
}) async {
    Color color;
    IconData icon;
    switch(type) {
        case SNACKBAR_TYPE.failure: color = LSColors.red; icon = Icons.error_outline; break;
        case SNACKBAR_TYPE.success: color = LSColors.accent; icon = Icons.check_circle_outline; break;
        case SNACKBAR_TYPE.info: color = LSColors.blue; icon = Icons.info_outline; break;
    }
    Flushbar(
        titleText: Padding(
            child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                ),
            ),
            padding: EdgeInsets.only(left: _LEFT_PADDING),
        ),
        boxShadows: [BoxShadow(blurRadius: 6.0, spreadRadius: 4.0, color: Colors.black.withOpacity(0.10))],
        messageText: Padding(
            child: Text(
                message,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.0,
                ),
            ),
            padding: EdgeInsets.only(left: _LEFT_PADDING),
        ),
        //message: message,
        duration: duration != null
            ? duration
            : showButton
                ? Duration(seconds: 4)
                : Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.FLOATING,
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        icon: Padding(
            child: LSIconButton(
                icon: icon,
                color: color,
            ),
            padding: EdgeInsets.only(left: _LEFT_PADDING),
        ),
        mainButton: showButton
            ? FlatButton(
                child: Text(
                    buttonText.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),
                ),
                textColor: LSColors.accent,
                onPressed: buttonOnPressed,
            )
            : null,
        animationDuration: Duration(milliseconds: 375),
        backgroundColor: Theme.of(context).primaryColor,
    )..show(context);
}
