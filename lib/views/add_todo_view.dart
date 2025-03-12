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
        child: SingleChildScrollView(
          // ใช้ SingleChildScrollView เพื่อให้เลื่อนดูได้หากคีย์บอร์ดขึ้น
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ใช้ Card ห่อหุ้มทั้งหมด
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // มุมโค้ง
                ),
                elevation: 5, // เพิ่มเงาให้กับการ์ด
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ชื่อรายการ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), // เพิ่มกรอบรอบช่องกรอก
                          hintText: 'กรุณากรอกชื่อรายการ',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'รายละเอียด',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: subtitleController,
                        maxLines: 5, // เพิ่มให้สามารถพิมพ์หลายบรรทัด
                        keyboardType:
                            TextInputType.multiline, // รองรับการพิมพ์หลายบรรทัด
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), // เพิ่มกรอบรอบช่องกรอก
                          hintText: 'กรุณากรอกรายละเอียด',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            217,
                            252,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 40,
                          ), // เพิ่ม padding เพื่อทำให้ปุ่มใหญ่ขึ้น
                          minimumSize: Size(
                            double.infinity,
                            60,
                          ), // ขนาดปุ่มขั้นต่ำ (ความสูง 60)
                          textStyle: TextStyle(
                            fontSize: 20,
                          ), // ขนาดตัวอักษรใหญ่ขึ้น
                        ),
                        onPressed: () {
                          // ตรวจสอบว่ามีการกรอกข้อมูลในช่องชื่อรายการ
                          if (titleController.text.isEmpty ||
                              subtitleController.text.isEmpty) {
                            // แสดง Snackbar แจ้งเตือนเมื่อข้อมูลไม่ครบ
                            Get.snackbar(
                              'แจ้งเตือน',
                              'กรุณากรอกข้อมูลให้ครบ',
                              backgroundColor: Colors.red.withOpacity(
                                0.3,
                              ), // สีพื้นหลังของ Snackbar
                              colorText:
                                  Colors.black, // สีของข้อความใน Snackbar
                            );
                            return; // หยุดการทำงานหากกรอกข้อมูลไม่ครบ
                          }
                          // bool isDuplicate = todoController.todoList.any(
                          //   (todo) => todo.title == titleController.text,
                          // );

                          // if (isDuplicate) {
                          //   // ถ้าซ้ำ แสดง Snackbar แจ้งเตือน
                          //   Get.snackbar(
                          //     'แจ้งเตือน',
                          //     'รายการนี้มีอยู่แล้ว',
                          //     backgroundColor: Colors.red.withOpacity(
                          //       0.3,
                          //     ), // สีพื้นหลังของ Snackbar
                          //     colorText: Colors.black,
                          //   );
                          //   return;
                          // }

                          // ถ้ามีการกรอกข้อมูลครบถ้วนแล้ว ทำการเพิ่ม Todo
                          todoController.addTodo(
                            titleController.text,
                            subtitleController.text,
                          );

                          // กลับไปหน้าก่อนหน้า
                          Get.back();

                          // แสดง Snackbar แจ้งเตือนเมื่อบันทึกรายการสำเร็จ
                          Get.snackbar(
                            'แจ้งเตือน',
                            'บันทึกรายการสำเร็จ',
                            backgroundColor: Colors.green.withOpacity(
                              0.3,
                            ), // สีพื้นหลังของ Snackbar
                            colorText: Colors.black, // สีของข้อความใน Snackbar
                          );
                        },
                        child: Text('บันทึก'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
