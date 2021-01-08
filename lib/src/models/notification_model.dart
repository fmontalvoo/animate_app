import 'package:flutter/material.dart';

class NotificationModel extends ChangeNotifier {
  int _numero;
  AnimationController _bounceController;

  NotificationModel() {
    this._numero = 0;
  }

  set setNumero(int numero) {
    this._numero = numero;
    notifyListeners();
  }

  int get getNumero => this._numero;

  set setBounceController(AnimationController bounceController) {
    this._bounceController = bounceController;
  }

  AnimationController get getBounceController => this._bounceController;
}
