import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/widgets/app_text_feild.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สมัครสมาชิก"),
        backgroundColor: Color.fromARGB(255, 163, 225, 250),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // เพิ่ม Padding รอบๆ Body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFeild(label: "อีเมล", controller: emailController),
            SizedBox(height: 16),
            AppTextFeild(label: "รหัสผ่าน", controller: passwordController),
            SizedBox(height: 16),
            AppTextFeild(
              label: "ยืนยันรหัสผ่าน",
              controller: confirmPasswordController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 217, 252),
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 60), // ปรับขนาดปุ่ม
                textStyle: TextStyle(fontSize: 18), // ปรับขนาดตัวอักษร
              ),
              onPressed: () {
                if (!GetUtils.isEmail(emailController.text)) {
                  //ตรวจสอบว่าเป็นอีเมลไหม
                  Get.snackbar(
                    "ผิดพลาด",
                    "กรุณากรอกอีเมลให้ถูกต้อง",
                    backgroundColor: Colors.red.withOpacity(0.3),
                    colorText: Colors.black,
                  );
                  return;
                }
                if (passwordController.text.length < 6) {
                  //ตรวจสอบว่ากรอกรหัส ผ่านอย่างน้อย 6 ตัว
                  Get.snackbar(
                    "ผิดพลาด",
                    "กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัว",
                    backgroundColor: Colors.red.withOpacity(0.3),
                    colorText: Colors.black,
                  );
                  return;
                }
                if (passwordController.text != confirmPasswordController.text) {
                  //ตรวจสอบว่ารหัสผ่านตรงกัน
                  Get.snackbar(
                    "ผิดพลาด",
                    "รหัสผ่านไม่ตรงกัน",
                    backgroundColor: Colors.red.withOpacity(0.3),
                    colorText: Colors.black,
                  );
                  return;
                }
                // logic สมัครสมาชิก as here
                authController.register(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text("สมัคร"),
            ),
          ],
        ),
      ),
    );
  }
}
