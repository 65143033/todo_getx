import 'package:get/get.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/services/storage_service.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageService storageService = StorageService();

  @override
  void onInit() {
    super.onInit();
    todoList.value = storageService.read('todoList');
  }

  void addTodo(String title, String subtitle) {
    todoList.add(TodoModel(title, subtitle, false));
    storageService.write('todoList', todoList.toJson());
  }

  void toggletodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
  }
}
