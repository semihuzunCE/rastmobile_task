import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  BuildContext context;
  ToastMessage({required this.context});

  void showToast({String? errorMessage}) {
    FToast fToast = FToast();
    fToast.init(context);
    //mevcut toastları kapatır.
    fToast.removeCustomToast();
    //toast mesaj içeriği
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.purpleAccent.shade100,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error),
          const SizedBox(
            width: 12.0,
          ),
          Text(errorMessage ?? " Hata! Veriler Çekilemedi"),
        ],
      ),
    );
    //toast mesaj gösterme
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
