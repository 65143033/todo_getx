import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/views/register_view.dart';
import 'package:todo_getx/widgets/app_text_feild.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ลงชื่อเข้าสู่ระบบ"),
        backgroundColor: Color.fromARGB(255, 163, 225, 250),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0), // เพิ่ม Padding รอบๆ Body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFeild(label: "อีเมล", controller: emailController),
            SizedBox(height: 16),
            AppTextFeild(
              label: "รหัสผ่าน",
              controller: passwordController,
              hideText: true,
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
                // if (passwordController.text.length < 6) {
                //   //ตรวจสอบว่ากรอกรหัส ผ่านอย่างน้อย 6 ตัว
                //   Get.snackbar(
                //     "ผิดพลาด",
                //     "รหัสผ่านไม่ถูกต้อง",
                //     backgroundColor: Colors.red.withOpacity(0.3),
                //     colorText: Colors.black,
                //   );
                //   return;
                // }
                authController.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text("เข้าสู่ระบบ"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 163, 225, 250),
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 60), // ปรับขนาดปุ่ม
                textStyle: TextStyle(fontSize: 18), // ปรับขนาดตัวอักษร
              ),
              onPressed: () {
                Get.to(RegisterView());
              },
              child: Text("สมัครเข้าใช้งาน"),
            ),
          ],
        ),
      ),
    );
  }
}
