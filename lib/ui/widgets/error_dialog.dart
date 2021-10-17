import 'dart:async';
import 'package:flutter/material.dart';

///A simple utility class for making an error dialog that disappears automatically
class DialogUtils  {
  static Future<bool> errorDialog(BuildContext context, {required String text}) async {
    Timer? _timer;
    return showDialog(
      context: context,
      builder: (BuildContext c2) {
        _timer = Timer(Duration(seconds: 5), () {
          Navigator.of(c2).pop();
        });
        return SimpleDialog(
          backgroundColor: Colors.red.shade800,
          title: const Text("Errore", style: TextStyle(fontSize: 32)),
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(text, style: const TextStyle(color: Colors.white)))
          ],
        );
      },
    ).then((val){
      if (_timer!.isActive) {
        _timer!.cancel();
      }
      return true;
    });
  }
}




