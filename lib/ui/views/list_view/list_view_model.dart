import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/services/bottom_sheet_service.dart';

@lazySingleton
class TodoListViewModel extends BaseViewModel {
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  Future<String> addItem() async {
    var newItem = await _bottomSheetService.showBottomSheet(
      description: 'Add a new Item',
    );
    print(newItem.fieldOne);
    return newItem.fieldOne;
  }

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
