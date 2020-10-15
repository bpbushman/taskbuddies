import 'package:cloud_firestore/cloud_firestore.dart';

class TodoList {
  String title;
  String description;
  List<Todo> complete;
  List<Todo> incomplete;
  Timestamp timeStamp;
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

  TodoList.fromMap(Map<String, dynamic> data) {
    TodoList(
        likes: data['likes'],
        isListComplete: data['isListComplete'],
        description: data['description'],
        title: data['title'],
        listId: data['listId'],
        ownerId: data['ownerId'],
        timeStamp: data['timeStamp'],
        incomplete: data['incomplete']);
  }

  Map<String, dynamic> toJson() => {
        'listId': listId,
        'likes': likes,
        'title': title,
        'description': description,
        'complete': [],
        'incomplete': [],
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
    Todo item = Todo(item: newItem, status: false);
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
  bool status;

  Todo({this.item, this.status});

  Map<String, dynamic> toJson() => {
        'item': item,
        'status': status,
      };

  factory Todo.fromData(dynamic data) {
    return Todo(
      item: data['item'] as String,
      status: data['status'] as bool,
    );
  }

  void toggleStatus() {
    this.status = !this.status;
  }
}
