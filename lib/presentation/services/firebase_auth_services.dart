import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithFirebase(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'wrong-password') {
          return null;
        } else if (e.code == 'user-not-found') {
          // 사용자가 존재하지 않는 경우 처리
          return null;
        } else {
          return null;
        }
      } else {
          return null;

      }
    }
  }

  // 이메일 및 비밀번호로 사용자 등록
  Future<User?> registerWithEmailPassword(String name, String email, String pw, String pwcheck) async {
    
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pw,
      );
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  Future<bool> signOut() async {
    try{
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
      }
  }

  Future<bool> deleteAuth() async {
    try{
      await FirebaseAuth.instance.currentUser!.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

}