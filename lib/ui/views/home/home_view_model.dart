import 'package:stacked/stacked.dart';
import 'package:taskbuddies/models/todo_list.dart';

class HomeViewModel extends BaseViewModel {
  TodoList myList = TodoList(
    title: 'My List',
    complete: [],
    incomplete: [],
    isListComplete: false,
  );

  void newItemToList(String newItem) {
    myList.addNewItem(newItem);
    notifyListeners();
  }

  void printList() {
    myList.incomplete.forEach((element) {
      print(element.item);
      print('${element.status}');
    });
  }
}
