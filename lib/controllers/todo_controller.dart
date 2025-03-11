import 'package:get/get.dart';
import 'package:todo_getx/models/todo_model.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;

  void addTodo(String title, String subtitle) {
    todoList.add(TodoModel(title, subtitle, false));
  }

  void toggletodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
  }
}
