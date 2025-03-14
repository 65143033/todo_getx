import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';

class AddTodoView extends StatefulWidget {
  AddTodoView({super.key, this.todo});
  TodoModel? todo;

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  TodoController todoController = Get.put(TodoController());
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  bool isLoading = false; // สถานะการโหลด

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      titleController.text = widget.todo!.title;
      subtitleController.text = widget.todo!.subtitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo == null ? 'เพิ่มรายการ' : 'แก้ไขรายการ'),
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
                        onPressed: () async {
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

                          // ทำให้ปุ่มแสดง "Loading"
                          setState(() {
                            isLoading = true;
                          });

                          // ใช้ Future.delayed เพื่อเพิ่มความล่าช้า
                          await Future.delayed(Duration(milliseconds: 700));

                          // ถ้ามีการกรอกข้อมูลครบถ้วนแล้ว ทำการเพิ่ม Todo
                          if (widget.todo != null) {
                            widget.todo!.title = titleController.text;
                            widget.todo!.subtitle = subtitleController.text;
                            todoController.updateTodo(widget.todo!);
                          } else {
                            todoController.addTodo(
                              titleController.text,
                              subtitleController.text,
                            );
                          }

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

                          // กลับสถานะของปุ่มให้เป็นปกติ
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child:
                            isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text('บันทึก'),
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
