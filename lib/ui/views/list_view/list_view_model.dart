import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/models/todo_list.dart';

@lazySingleton
class TodoListViewModel extends BaseViewModel {
  /*void addNewItem(TodoList listTocompare, String newItem) {
    todoLists.where((element) {
      element.title == listTocompare.title;
      element.addNewItem(newItem);
    });
  }*/

  List<TodoList> todoLists = [
    TodoList(
        complete: [],
        incomplete: [
          Todo(item: 'task one', status: false, note: ''),
          Todo(item: 'task two', status: false, note: ''),
          Todo(item: 'task three', status: false, note: ''),
          Todo(item: 'task four', status: false, note: ''),
        ],
        title: 'First list',
        description: 'hardcoded list',
        isListComplete: false),
    TodoList(
        complete: [],
        incomplete: [
          Todo(item: 'task one', status: false, note: ''),
          //Todo(item: 'task two', status: false, note: ''),
          Todo(item: 'task three', status: false, note: ''),
          Todo(item: 'task four', status: false, note: ''),
        ],
        title: 'Second list',
        description: 'another hardcoded list',
        isListComplete: false),
    TodoList(
        complete: [],
        incomplete: [
          Todo(item: 'task one', status: false, note: ''),
          Todo(item: 'task two', status: false, note: ''),
          // Todo(item: 'task three', status: false, note: ''),
          //Todo(item: 'task four', status: false, note: ''),
        ],
        title: 'Third list',
        description: 'last hardcoded list',
        isListComplete: false),
  ];
}
