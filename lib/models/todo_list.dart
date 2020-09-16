import 'package:flutter/material.dart';

class TodoList {
  String title;
  String description;
  List<Todo> complete;
  List<Todo> incomplete;
  bool isListComplete;

  TodoList({
    this.complete,
    this.incomplete,
    this.isListComplete,
    this.description,
    this.title,
  });

  void addNewItem(String newItem) {
    Todo item = Todo(item: newItem, note: '', status: false);
    this.incomplete.add(item);
    sortItem();
  }

  void completeItem(Todo item) {
    item.setStatusTocomplete();
    this.complete.add(item);
    sortItem();
  }

  void sortItem() {
    this.incomplete.removeWhere((element) => element.status == true);
  }
}

class Todo extends ChangeNotifier {
  String item;
  String note;
  bool status;

  Todo({this.item, this.note, this.status});

  void setStatusTocomplete() {
    this.status = true;
    notifyListeners();
  }

  void setStatusToFalse() {
    this.status = false;
    notifyListeners();
  }
}
