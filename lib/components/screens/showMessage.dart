import 'dart:async';
import 'package:flutter/material.dart';

class ShowMessage {
  static void showAlertSuccess(context, msg) {
    Timer timer = Timer(Duration(milliseconds: 800), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    showDialog(
        context: context,
        child: new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.done, color: Colors.green, size: 40.0),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 10.0, bottom: 5.0),
                  child: Text(msg,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        )).then((value) {
      timer?.cancel();
      timer = null;
    });
  }
}
