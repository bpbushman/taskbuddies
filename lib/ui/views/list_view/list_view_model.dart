//import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/models/todo_list.dart';

@lazySingleton
class TodoListViewModel extends BaseViewModel {
  List<TodoList> todoLists = [
    TodoList(
        complete: [],
        incomplete: [],
        title: 'First list',
        description: 'hardcoded list',
        isListComplete: false),
    TodoList(
        complete: [],
        incomplete: [],
        title: 'Second list',
        description: 'another hardcoded list',
        isListComplete: false),
    TodoList(
        complete: [],
        incomplete: [],
        title: 'Third list',
        description: 'last hardcoded list',
        isListComplete: false),
  ];
}
