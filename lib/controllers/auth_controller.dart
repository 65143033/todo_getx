import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("สมัครสมาชิก", "สมัครสมาชิกเสร็จสิ้น");
    } catch (e) {
      Get.snackbar("สมัครสมาชิกก", e.toString());
    }
  }
}
