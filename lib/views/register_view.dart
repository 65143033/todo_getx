import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_getx/widgets/app_text_feild.dart';

class RegisterView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
              onPressed: () {},
              child: Text("สมัคร"),
            ),
          ],
        ),
      ),
    );
  }
}
