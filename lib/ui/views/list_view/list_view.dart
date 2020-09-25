import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/views/list_view/list_view_model.dart';
import 'package:taskbuddies/ui/widgets/list_widget.dart';

class TodoListView extends StatelessWidget {
  addListToWidget(List<TodoList> todo) {
    List<ListContainer> listWidget = [];
    todo.forEach((element) {
      listWidget.add(ListContainer(element));
    });
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    print('hello from todo list view');
    return ViewModelBuilder.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Container(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          children: addListToWidget(model.todoLists),
        ),
      ),
      viewModelBuilder: () => locator<TodoListViewModel>(),
    );
  }
}
