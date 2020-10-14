class TodoList {
  String title;
  String description;
  List<Todo> complete;
  List<Todo> incomplete;
  DateTime timeStamp;
  bool isListComplete;
  int likes;
  String listId;
  String ownerId;

  TodoList(
      {this.complete,
      this.likes,
      this.incomplete,
      this.isListComplete,
      this.description,
      this.title,
      this.listId,
      this.ownerId,
      this.timeStamp});

  Map<String, dynamic> toJson() => {
        'listId': listId,
        'likes': likes,
        'title': title,
        'description': description,
        'complete': complete,
        'incomplete': incomplete,
        'timeStamp': timeStamp,
        'isListComplete': isListComplete,
        'ownerId': ownerId,
      };

  List<Map<String, dynamic>> newListOfMaps(List<Todo> list) {
    List<Map<String, dynamic>> tempList = [];
    list.forEach((element) {
      tempList.add(element.toJson());
    });
    return tempList;
  }

  void completeListStatus() {
    this.isListComplete = !this.isListComplete;
  }

  void addNewItem(String newItem) {
    Todo item = Todo(item: newItem, note: '', status: false);
    this.incomplete.add(item);
  }

  void completeItem(Todo item) {
    item.toggleStatus();
    complete.add(item);
    this.incomplete.removeWhere((element) => element.status == true);
  }
}

class Todo {
  String item;
  String note;
  bool status;

  Todo({this.item, this.note, this.status});

  Map<String, dynamic> toJson() => {
        'item': item,
        'status': status,
      };

  Todo.fromData(Map<String, dynamic> data)
      : item = data['item'],
        note = data['note'],
        status = data['status'];

  void toggleStatus() {
    this.status = !this.status;
  }
}
