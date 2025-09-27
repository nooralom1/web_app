import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final class ToastUtil {
  ToastUtil._();
  static void showLongToast(String message) {
    String trn = message;
    Fluttertoast.showToast(msg: trn, toastLength: Toast.LENGTH_LONG);
  }

  static void showShortToast(String message) {
    Fluttertoast.showToast(
      textColor: Colors.white,
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showNoInternetToast() {
    Fluttertoast.showToast(
      msg: "Please check your internet connection",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showNotLoggedInToast() {
    Fluttertoast.showToast(
      msg: "Please login to perform this operation",
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
