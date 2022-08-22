///
/// [Author] lg (https://github.com/lemos1235)
/// [Date] 2022/8/22
///
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

void showCenterToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.CENTER,
  );
}

void showErrorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.redAccent,
  );
}

void showCenterErrorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.redAccent,
  );
}

void showTopToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.TOP,
  );
}

void dismissAllToast() {
  Fluttertoast.cancel();
}