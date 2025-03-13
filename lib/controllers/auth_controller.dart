import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_getx/views/home_view.dart';
import 'package:todo_getx/views/login_view.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(firebaseAuth.authStateChanges());
  }

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

  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("เข้าสู่ระบบ", "เข้าสู่ระบบเสร็จสิ้น");
      Get.off(HomeView());
    } catch (e) {
      Get.snackbar("เข้าสู่ระบบ", e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      Get.snackbar("ออกจากระบบ", "ออกจากระบบเสร็จสิ้น");
      Get.off(LoginView());
    } catch (e) {
      Get.snackbar("ออกไม่ได้", e.toString());
    }
  }
}
