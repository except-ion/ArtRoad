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
      print('Firebase 로그인 오류: $e');
      return null;
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
      print('등록 실패: $e');
      return null;
    }
  }

  Future<void> signOut() async {
      await _auth.signOut();
    }

}