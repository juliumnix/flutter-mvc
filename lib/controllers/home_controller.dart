import 'package:flutter/material.dart';
import 'package:to_do_mvc/model/todo.dart';

class HomeController {
  List<ToDo> _foundToDo = [];
  final _todosList = ToDo.todoList();
  final todoController = TextEditingController();
  List<ToDo> getTodosList() {
    return _todosList;
  }

  List<ToDo> getFoundToDo() {
    return _foundToDo;
  }

  void insertData() {
    _foundToDo = _todosList;
  }

  void handleToDoChange(ToDo todo) {
    todo.isDone = !todo.isDone;
  }

  void deleteToDoItem(String id) {
    _todosList.removeWhere((item) => item.id == id);
  }

  void addToDoItem(String toDo) {
    _todosList.add(ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoText: toDo,
    ));
    todoController.clear();
  }

  void runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = _todosList;
    } else {
      results = _todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    _foundToDo = results;
  }
}
