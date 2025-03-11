import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/views/add_todo_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        backgroundColor: const Color.fromARGB(255, 163, 225, 250),
      ),
      body: Obx(() {
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
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          ListTile(
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
                          Divider(
                            // เพิ่มขีดเส้นที่นี่
                            color: Colors.grey,
                            thickness: 1.5,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
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
