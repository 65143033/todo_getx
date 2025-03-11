import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/views/add_todo_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  TodoController todoController = Get.put(TodoController());

  // ฟังก์ชันแสดงสถานะว่ายังไม่มีรายการ
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.list_alt, size: 80, color: Colors.grey[400]),
          SizedBox(height: 10),
          Text(
            'ยังไม่มีรายการที่ต้องทำ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        backgroundColor: const Color.fromARGB(255, 163, 225, 250),
      ),
      body: Obx(() {
        // ตรวจสอบว่ามีข้อมูลหรือไม่ใน todoList
        if (todoController.todoList.isEmpty) {
          return _buildEmptyState(); // ถ้าไม่มีข้อมูลให้แสดง empty state
        } else {
          // ถ้ามีข้อมูลแสดงรายการใน ListView
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = todoController.todoList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Card(
                        elevation: 4, // ให้เงาสำหรับการตกแต่ง
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // มุมโค้งมน
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ), // ขอบกรอบ
                            color: Colors.white, // พื้นหลังสีขาว
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              todo.subtitle,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            leading: Checkbox(
                              value: todo.isDone,
                              onChanged: (bool? newValue) {
                                todoController.toggletodo(index);
                              },
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                todoController.deleteTodo(index);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodoView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
