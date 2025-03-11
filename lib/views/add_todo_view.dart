import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class AddTodoView extends StatelessWidget {
  AddTodoView({super.key});

  TodoController todoController = Get.put(TodoController());
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo View'),
        backgroundColor: const Color.fromARGB(255, 163, 225, 250),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('ชื่อรายการ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(), // เพิ่มกรอบรอบช่องกรอก
                hintText: 'กรุณากรอกชื่อรายการ',
              ),
            ),
            SizedBox(height: 20),
            Text('รายละเอียด', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(), // เพิ่มกรอบรอบช่องกรอก
                hintText: 'กรุณากรอกรายละเอียด',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty) return;
                todoController.addTodo(
                  titleController.text,
                  subtitleController.text,
                );
                Get.back();
                Get.snackbar(
                  'แจ้งเตือน',
                  'บันทึกรายการสำเร็จ',
                  backgroundColor: Colors.pink.withOpacity(
                    0.3,
                  ), // Light pink with transparency
                  colorText: Colors.black, // Text color
                );
              },
              child: Text('บันทึก'),
            ),
          ],
        ),
      ),
    );
  }
}
