import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/views/list_view/list_view_model.dart';

class TodoListView extends StatefulWidget {
  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  listOfTodoListsWidgets(List<TodoList> lists) {
    return ListView.builder(itemBuilder: null);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Column(
        children: [],
      ),
      viewModelBuilder: () => TodoListViewModel(),
    );
  }
}
