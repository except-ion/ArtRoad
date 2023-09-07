import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? firebaseUserId;

  void setFirebaseUserId(String userId) {
    firebaseUserId = userId;
    notifyListeners();
  }

  String? getFirebaseUserId(){
    return firebaseUserId;
  }
}