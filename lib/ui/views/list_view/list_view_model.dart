import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/models/user.dart';
import 'package:taskbuddies/services/authentication_service.dart';
import 'package:taskbuddies/services/bottom_sheet_service.dart';
import 'package:taskbuddies/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
class TodoListViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final List<TodoList> todoLists = [];
  final DateTime timeStamp = DateTime.now();
  String newId = Uuid().v4();

  bool areListsAvailable() {
    return todoLists.isEmpty;
  }

  Future _createList(TodoList newList, User user) async {
    var result = await _firestoreService.createList(newList, user);
    if (result is String) {
      await _dialogService.showDialog(
        title: 'Failure',
        description: result,
      );
    }
    print(result);
  }

  void deleteList(TodoList listToDelete) async {
    var result = await _dialogService.showConfirmationDialog(
        description: 'Tap Ok to delete your list',
        title: 'Are you sure you want to delete "${listToDelete.title}"');
    if (result.confirmed) {
      this.todoLists.removeWhere((element) {
        return listToDelete.title == element.title;
      });
      notifyListeners();
    }
  }

  void completeTask(Todo item, TodoList list) {
    list.completeItem(item);
    _snackBarService.showSnackbar(message: '${item.item} is complete!');
    notifyListeners();
  }

  void addItem(TodoList todoList) async {
    var newItem = await _bottomSheetService.showBottomSheet(
        description: 'Add a new Item', toggle: true);
    todoList.addNewItem(newItem.fieldOne);
    _firestoreService.createTask(todoList);
    notifyListeners();
  }

  void addNewList() async {
    var newItem = await _bottomSheetService.showBottomSheet(
        description: 'add description', title: 'add title', toggle: false);
    User user = _authenticationService.currentUser;
    TodoList newList = TodoList(
        listId: newId,
        likes: 0,
        timeStamp: timeStamp,
        complete: [],
        incomplete: [],
        isListComplete: false,
        title: newItem.fieldTwo,
        ownerId: user.uid,
        description: newItem.fieldOne);
    _createList(newList, user);
    todoLists.add(newList);
    notifyListeners();
  }
}
