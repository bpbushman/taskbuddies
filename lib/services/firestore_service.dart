import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/models/user.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _userRef = Firestore.instance.collection("users");
  final CollectionReference _listRef = Firestore.instance.collection("lists");
//getting users and creating users
  Future createUser(User user) async {
    try {
      await _userRef.document(user.uid).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userRef.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  Future getUserLists(User user) async {
    try {
      var userLists = await _listRef
          .document(user.uid)
          .collection('userLists')
          .getDocuments()
          .then((value) {
        return value.documents.map((data) {
          return TodoList(
              likes: data['likes'] as int,
              isListComplete: data['isListComplete'] as bool,
              description: data['description'] as String,
              title: data['title'] as String,
              listId: data['listId'] as String,
              ownerId: data['ownerId'] as String,
              timeStamp: data['timeStamp'] as Timestamp,
              complete: _newlistFromMap(data['incomplete']),
              incomplete: _newlistFromMap(data['incomplete']));
        }).toList();
      });
      return userLists;
    } catch (e) {
      return e.toString();
    }
  }

  //methods to send and get lists from firebase
  Future createList(TodoList todoList, User user) async {
    try {
      await _listRef
          .document(user.uid)
          .collection('userLists')
          .document(todoList.listId)
          .setData(todoList.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future updateList(TodoList list) async {
    try {
      await _listRef
          .document(list.ownerId)
          .collection('userLists')
          .document(list.listId)
          .updateData({
        "incomplete": list.newListOfMaps(list.incomplete),
        "complete": list.newListOfMaps(list.complete)
      });
    } catch (e) {
      return e.message;
    }
  }

  Future deleteList(TodoList list) async {
    try {
      await _listRef
          .document(list.ownerId)
          .collection('userLists')
          .document(list.listId)
          .delete();
    } catch (e) {
      return e.toString();
    }
  }

  List<Todo> _newlistFromMap(List<dynamic> todo) {
    if (todo.isEmpty) {
      return [];
    }
    var tempList = todo.map((e) => Todo.fromData(e)).toList();
    return tempList;
  }
}
