import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/services/bottom_sheet_service.dart';

@lazySingleton
class TodoListViewModel extends BaseViewModel {
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  List<TodoList> todoLists = [];

  bool areListsAvailable() {
    return todoLists.isEmpty;
  }

  void addItem(TodoList todoList) async {
    var newItem = await _bottomSheetService.showBottomSheet(
        description: 'Add a new Item', toggle: true);
    todoList.addNewItem(newItem.fieldOne);
    notifyListeners();
  }

  void addNewList() async {
    var newItem = await _bottomSheetService.showBottomSheet(
        description: 'add caption', title: 'add title', toggle: false);
    todoLists.add(TodoList(
        complete: [],
        incomplete: [],
        isListComplete: false,
        title: newItem.fieldTwo,
        description: newItem.fieldOne));
    notifyListeners();
  }
}
